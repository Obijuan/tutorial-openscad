// Created from Code_Yidler_623.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

dTal = 6.4;		// Diámetro del taladro (Soporte) (6.4)

//Características del tornillo (Polea)
dTor = 3.3;		// Diámetro de la rosca (3.3)
dCab = 5.8;		// Diámetro de la cabeza (5.6)
hHex = 5.8;		// Altura entre caras planas de la tuerca (5.8)


// Media pieza
module mpieza(){
	// Bloque a lo largo del eje X
		translate([0, -5, 0])
		cube([11, 5, 16]);

	//	Bloque a lo largo del eje Y
	//	Bloque grande
		translate([6, -27, 0])
		cube([5, 27, 16]);
	//	Bloque pequeño
		translate([5, -14, 0])
		cube([1, 9, 16]);
		hull(){
			//	Redondeo
			translate([6, -27, 8])
			rotate( 90, [0, 1, 0])
			cylinder(h = 5, r = 8, $fn=100);
			// Chaflán inferior
			translate([6, -30.8, 0])
			cube([5, 10, 1]);
		}
}

// Operaciones para media pieza
module moperaciones(){
	// Taladro del soporte
	translate([0, 1, 8])
	rotate( 90, [1, 0, 0])
	cylinder(h = 7, r = dTal/2, $fn=100);
	// Taladro para la polea
	translate([5, -27, 8])
	rotate( 90, [0, 1, 0])
	cylinder(h = 7, r = dTor/2, $fn=100);
	// Chaflán interior
	translate([6, -14, -1])
	rotate( 225, [0, 0, -1])
	cube([2, 1, 18]);
}

// Generar un hexágono circunscrito (Diámetro,Altura) 
module hexagono(d,h){ 
	for (a = [0, 60,120]){ 
		rotate( a, [0, 0, 1])
		cube([d, d*tan(30), h], center = true);
	}
}

// Alojamiento de la cabeza del tornillo 
module tcab(){ 
	translate([10, -27, 8])
	rotate( 90, [0, 1, 0])
	cylinder(h = 2, r = dCab/2, $fn=100);
}

// Alojamiento de la tuerca
module tuerca(){ 
	translate([-11, -27, 8])
	rotate( 90, [0, 1, 0])
	hexagono(hHex, 4);

}

// Creamos la pieza a partir de las operacione
module pieza(){
	difference () {
		union() {
			// Pieza situada en {+X,-Y,+Z}
			mpieza();	
		
			// Pieza simétrica situada en {-X,-Y,+Z}
			mirror([ 1, 0, 0 ])
			mpieza();
		}	
		union() {
			// Operaciones situadas en {+X,-Y,+Z}
			moperaciones();
	
			// Operaciones simétricas situadas en {-X,-Y,+Z}
			mirror([ 1, 0, 0 ])
			moperaciones();

		// Operaciones únicas para cada lado
			// Vaciado para la cabeza del tornillo
			tcab();
			// Vaciado para la tuerca hexagonal 
			tuerca();
		}	
	}
}

// Generamos la pieza!!

	pieza();

