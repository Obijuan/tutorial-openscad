// Created from Code_Ztop.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

dBar = 8.1;		// Diámetro de la varilla (8.1)

//Características del tornillo 
dCab = 18;		// Diámetro de la cabeza (18)
hcub = 6.8;		// Anchura del cuadrado (6.8)



// Bloque a trabajar
module bloque(){
	// Bloque tornillo en el eje y
	cube([12, 40, 24]);
	// Bloque varilla en plano xy
	translate([0, 21, 0])
	cube([45, 19, 5]);
	// Bloque a lo largo del eje x
	translate([0, 35, 0])
	cube([37, 5, 24]);
}

// Redondeo del bloque varilla en plano xy
module redondeoxy(){
	// Redondeo
	translate([15, 21, -1])
	cylinder(h = 7, r = 3, $fn=100);
	// Vaciado del sobrante
	translate([15, 20, -1])
	cube([31, 4, 7]);
}

// Alojamiento de la varilla
module tvar(){
	// Taladro
	translate([37, 29.5, -1])
	cylinder(h = 7, r = dBar/2, $fn=100);
	// Canal
	translate([36.5, 23.5, 1])
	cube([1, 6, 5]);
}

// Alojamiento del tornillo
module ttor(){
	translate([9, 17, 15])
	union() {
		// Parte cuadrada
		cube([20, hcub, hcub], center = true);
		// Parte cilíndrica
		rotate( 90, [0, 1, 0])
		cylinder(h = 4, r = dCab/2, $fn=100);
	}
	// Vaciado superior
	translate([9, 13.6, 15])
	cube([4, 8, 10]);
}

// Operaciones a lo largo del eje y
module operacionesY(){

	translate([-1, -1, 5])
	cube([6, 32, 20]);

	translate([-1, 30, 9])
	cube([6, 11, 16]);

	translate([-1, 31, 5])
	rotate( 90 ,[0, 1, 0])
	rotate( 135 ,[0, 0, 1])
	cube([6, 6, 6]);

}

// Chaflanes del bloque tornillo
module chaftor(){
	// Chaflán verticall
	translate([7, 0, -1])
	rotate( -45 ,[0, 0, 1])
	cube([4, 7, 21]);
	// Chaflán superior
	translate([4, 0, 14])
	rotate( 90 ,[0, 1, 0])
	rotate( 135 ,[0, 0, 1])
	cube([15, 8, 9]);
}

//Chaflanes a lo largo del eje X
module chaflanX(){
	// Chaflán grande
	translate([0, 40, 9])
	rotate( 90 ,[0, 1, 0])
	rotate( 135 ,[0, 0, 1])
	cube([12, 22, 34]);
	// Chaflán pequeño
	translate([37, 41, 5])
	rotate( 90 ,[1, 0, 0])
	rotate( 45 ,[0, 0, 1])
	cube([15, 22, 7]);
}

//Chaflanes del bloque varilla en plano xy
module chafvar(){
	// Chaflán grande
	translate([45, 35, -1])
	rotate( 45 ,[0, 0, 1])
	cube([6, 8, 7]);
	// Chaflán pequeño
	translate([42, 24, -1])
	rotate( -45 ,[0, 0, 1])
	cube([8, 12, 7]);
}

// Unión de todos los bloques y operaciones
module pieza(){
	difference () {
		// Bloque a trabajar
		bloque();

		// Unión de operaciones
		union() {
			// Alojamiento de la varilla
			tvar();
			// Alojamiento para el tornillo
			ttor();
			// Redondeo del bloque varilla en plano xy
			redondeoxy();
			// Operaciones a lo largo del eje y
			operacionesY();
			// Chaflanes
			chaftor();
			chaflanX();
			chafvar();

		} //union end	
	} // difference end
} // module pieza end

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
