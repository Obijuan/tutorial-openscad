// Created from Code_Zbotton.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

// Diámetro de la varilla (8.1)
dBar = 8.1;		

// Diámetro de los tornillos de soporte para el motor (3.4)
dMot = 3.4;			

//Características del tornillo 
dCab = 20;		// Diámetro de la cabeza (20)
hcub = 6.8;		// Anchura del cuadrado (6.8)


// Bloque a lo largo de X
module bloqueX(){
	difference(){
		// Bloque a lo largo del eje x
		translate([0, 45, 0])
		cube([40, 5, 33]);
		// Chaflán 
		translate([40, 44, 6])
		rotate( -49.84, [0, 1, 0])
		cube([22, 7, 43]);
	}

	// Muesca de encaje del soporte
	difference(){
		// Cilindro
		translate([0, 45, 0])
		cylinder(h = 33, r = 5, $fn=100);
		// Vaciado en forma de media luna
		translate([-5, 40, -1])
		cube([10, 5, 35]);
	}
}
// Bloque a lo largo de Y o bloque tornillo
module bloqueY(){
	difference(){
		// Bloque tornillo en el eje y
		cube([8, 45, 33]);
		// Chaflán 
		translate([-1, 0, 13])
		rotate( 53.13, [1, 0, 0])
		cube([10, 26, 14]);
	}
}


// Alojamiento de la varilla
module tvar(){
	// Taladro
	translate([32, 39.55, -1])
	cylinder(h = 8, r = dBar/2, $fn=100);
	// Canal
	translate([31.5, 33.5, -1])
	cube([1, 6, 6]);
}

// Bloque en el plano xy
module bloqueXY(){
	difference(){
		// Bloque base
		cube([53.5, 50, 6]);
		// Operaciones a realizar en la zona 
		union(){
			// Chaflán 
			translate([43.5, 50, -1])
			rotate( -45, [0, 0, 1])
			cube([15, 8, 8]);
			// Vaciado para el motor
			translate([20, -1, -1])
			cube([34, 23.5, 8]);
			translate([34, 20.5, -1])
			cube([20, 12, 8]);
			translate([32, 22.5, -1])
			cylinder(h = 8, r = 12, $fn=100);
			// Taladros de anclaje del motor
			translate([16.5, 7, -1])
			cylinder(h = 8, r = dMot/2, $fn=100);
			translate([47.5, 38, -1])
			cylinder(h = 8, r = dMot/2, $fn=100);
			// Alojamiento de la varilla
			tvar();
		}
	}

}

// Redondeo entre el bloque tornillo y bloque del plano XY
module redondeoXYT(){
	difference(){
		// Cubo
		translate([8, 0, 6])
		cube([2, 46, 2]);
		// redondeo
		translate([10, -1, 8])
		rotate( -90, [1, 0, 0])
		cylinder(h = 47, r = 2, $fn=100);
	}
}

// Alojamiento del tornillo
module tornillo(){
	translate([5.5, 27, 13])
	union() {
		cube([20, hcub, hcub], center = true);
		rotate( 90, [0, 1, 0])
		cylinder(h = 10.5, r = dCab/2, $fn=100);
	}

}

// Unión de todos los bloques y operaciones
module pieza(){
	difference () {
		union() {
			// Bloque a lo largo de X
			bloqueX();
			// Bloque a lo largo de Y o bloque tornillo
			bloqueY();
			// Bloque en el plano xy
			bloqueXY();	
			// Redondeo entre el bloqueY() y el bloqueXY()

			redondeoXYT();
		} //union end	

		// Alojamiento del tornillo que afecta a los bloques:
		//  bloqueY(),  bloqueXY() y redondeoXYT()
		tornillo();


	} // difference end
}// module pieza end


/**************************/
//  Generamos las piezas   /
/**************************/


// Pieza normal
	
	translate([0, 8, 0])
	pieza();

// Pieza simetrica

	translate([0, -8, 0])
	mirror([ 0, 1, 0 ]) 
	pieza();
