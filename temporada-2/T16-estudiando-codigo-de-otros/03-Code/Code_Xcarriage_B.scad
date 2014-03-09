// Created from Code_Xcarriage_B.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

dGran = 5.8;	// Diámetro del taladro exterior (5.8)
dPeque = 3.6;	// Diámetro del taladro interior (3.6)


// Dientes de sujeción 
module diente(){
	rotate( -135, [0, 1, 0])
	cube([3, 14.5, 3]);
}

// Saliente redondeado 
module saliente(){
	hull(){
		// Parte plana
		translate([6.5, 0, 0])
		cube([3, 1.5, 9.4]);
		translate([6.5, 1.5, 0])
		cube([2, 1, 9.4]);
		// Redondeo 
		translate([8.5, 1.5, 0])
		cylinder(h = 9.4, r = 1, $fn=100);
	}
}

// Taladros de la pieza
module taladro(){
	// Pequeño
	translate([-1, 6, 4.7])
	rotate( 90, [0, 1, 0])
	cylinder(h = 10, r = dPeque/2, $fn=100);
	// Grande
	translate([-1, 6, 4.7])
	rotate( 90, [0, 1, 0])
	cylinder(h = 4, r = dGran/2, $fn=100);
}

// Pieza y las operaciones
module pieza(){
	difference () {
		// Parte solida de la pieza
		union() {
			// Cubo base a lo largo del eje Y
			cube([6.5, 17, 9.4]);	
			// Saliente redondeado
			saliente();
			// Posicionamos los dos diente 
			translate([8, 2.5, 2.5])
			diente();
			translate([8, 2.5, 6.5])
			diente();
		}
		// Aplicamos los taladros
		taladro();
	}	
}

// Generamos la pieza!!

	pieza();

