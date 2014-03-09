// Created from Code_LevelExtruder.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parametros de la pieza  /
/**************************/

hBase = 8 ;		// Altura de la base (8)

dExtru = 40;	// Radio central del extrusor (40)

// Los dos taladros del soporte //
dTaSo = 4.6;	// Diametro del taladro (4.6)
lTaCe = 25; 	// Longitud perpendicular desde Z (25)

// Carriles de desplazamiento //
dCaPe = 3.4;	// Diametro del carril pequeño (3.4)
dCaGr = 5.8;	// Diametro del carril grande (5.8)
lCaPr = 3;		// Profundidad del carril grande (3)

// Un cuarto de la base  
module cbase(){
	difference () {
		//Rectangulo hueco
		union() {
			translate([8.5, 0, 0])
			cube([13, 22, hBase]);
		
			translate([0, 20, 0])
			cube([13.5, 10, hBase]);
	
			//Redondeo
			translate([13.5, 22, 0])
			cylinder(h = hBase, r = 8, $fn=100);
		}
		// Carril grande
		translate([15-(dCaGr/2), 0, hBase-lCaPr])
		cube([dCaGr, 22, lCaPr+1]);
		// Carril pequeño
		translate([15-(dCaPe/2), 0, -1])
		cube([dCaPe, 22, hBase+2]);
	}
}

// Un cuarto de las operaciones de la base 
module cboperaciones(){
	// Eliminar el sobrante interior del redondeo
	translate([0, 14, -1])
	cube([8.5, 6, hBase+2]);
	// Redondeo del Carril grande
	translate([15, 22, hBase-lCaPr])
	cylinder(h = lCaPr+1, r = dCaGr/2, $fn=100);
	// Redondeo del Carril pequeño
	translate([15, 22, -1])
	cylinder(h = hBase+2, r = dCaPe/2, $fn=100);

}

// Medio soporte
module msoporte(){
	//Saliente principal
	translate([8.5, 0, 0])
	cube([26.5, 5, 44]);

	translate([31, 0, 17])
	cube([4, 20, 27]);
	
	difference () {
		translate([21.5, 22, 0])
		rotate( 180, [0, 0, 1])
		rotate( -40, [0, 1, 0])
		cube([5.14, 22, 27]);

		translate([17, 5, 0.1])
		cube([3, 22, 6.5]);
	}		
}

// Medio parte de las operaciones del soporte
module msoperaciones(){
	// Taladro central r = 20
	translate([0, -1, 29.447])
	rotate( -90, [1, 0, 0])
	cylinder(h = 7, r = dExtru/2, $fn=100);
	// Taladros de r = 2.3
	translate([lTaCe, -1, 30])
	rotate( -90, [1, 0, 0])
	cylinder(h = 7, r = dTaSo/2, $fn=100);
	// Chaflanes
	translate([35, -1, 15])
	cube([4, 24, 10]);

	translate([21.5, -1, 0])
	rotate( 40, [0, 1, 0])
	cube([12, 7, 22]);

	translate([24, 22, 12])
	rotate( 28, [1, 0, 0])
	cube([12, 15, 40]);
	// Carril grande que pasa por debajo el soporte
	translate([15-(dCaGr/2), -1, hBase-lCaPr])
	cube([dCaGr, 7, lCaPr]);
	// Carril pequeño que pasa por debajo el soporte
	translate([15-(dCaPe/2), -1, -1])
	cube([dCaPe, 9, hBase+1]);
}

// Unimos base y soporte, 
// y aplicamos las operaciones
difference () {
	union() {
		// {+X,+Y,+Z}
		cbase();
		msoporte();
		// {-X,+Y,+Z}
		mirror([ 1, 0, 0 ])
		union() {
			cbase();
			msoporte();
		}
		// {+X,-Y,+Z}
		mirror([ 0, 1, 0 ])
		cbase();
		// {-X,-Y,+Z}
		mirror([ 0, 1, 0 ])
		mirror([ 1, 0, 0 ])
		cbase();
	}	
	union() {
		// {+X,+Y,+Z}
		cboperaciones();
		msoperaciones();
		// {-X,+Y,+Z}
		mirror([ 1, 0, 0 ])
		union(){
			cboperaciones();
			msoperaciones();
		}
		// {+X,-Y,+Z}
		mirror([ 0, 1, 0 ])
		cboperaciones();
		// {-X,-Y,+Z}
		mirror([ 0, 1, 0 ])
		mirror([ 1, 0, 0 ])
		cboperaciones();
	}	
}