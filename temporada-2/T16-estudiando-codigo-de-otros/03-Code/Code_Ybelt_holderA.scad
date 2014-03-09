// Created from Code_Ybelt_holderA.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

//Características del tornillo
dTor = 6.6;		// Diámetro de la rosca (6.6)


// Media Pieza
module mpieza(){
	// Bloque a lo largo del eje X
	cube([18.5, 7, 16]);
	// Bloque de sujeción para la correa
	difference(){
		// Bloque
		translate([11, 0, 0])
		cube([7.5, 15, 16]);
		// Zócalo para el diente de la parte B
		translate([14.75, 15, -1])
		rotate( 90, [0, 0, 1])
		cylinder(h = 18, r = 1, $fn=100);
	}
	// Soporte plano del clip
	translate([12.5, -4.355, 0])
	cube([4, 4.355, 16]);
	// Cabeza del soporte 
	clip();
}

// Cilindro operado en forma de clip 
module clip(){
	difference(){
		// Cilindro base 
		translate([11.5, -4.355, 0])
		rotate( 90, [0, 0, 1])
		cylinder(h = 16, r = 5, $fn=100);
		// Operaciones de vaciado 
		union(){
			translate([6.5, -5, -1])
			cube([6, 6, 18]);
		
			translate([12.5, -5, -1])
			rotate( 120, [0, 0, 1])
			cube([4, 6, 18]);
		
			translate([12, -5.288, -1])
			rotate( 200, [0, 0, 1])
			cube([5, 4, 18]);
		}
	}
}

// Taladro para el tornillo
module taladro(){
	translate([0, -1, 8])
	rotate( -90, [1, 0, 0])
	cylinder(h = 9, r = dTor/2, $fn=100);

}

// Creamos la pieza a partir de la mpieza() y le añadimos el taladro()
module pieza(){
	difference () {
		union() {
			// Pieza situada en +X
			mpieza();
			// Pieza situada en -X
			mirror([ 1, 0, 0 ])
			mpieza();
		}	
		// Taladro para el tornillo
		taladro();
	}
}

// Generamos la pieza!!

	pieza();

