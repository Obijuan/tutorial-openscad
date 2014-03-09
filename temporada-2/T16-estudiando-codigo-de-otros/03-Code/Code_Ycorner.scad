// Created from Code_Ycorner (x3).stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

// Diámetro del tornillo (10.6)
dPas = 10.6;	

// Pieza principal a trabajar
module bloque(){
	cube([20, 30.5, 16]);	
}

// Taladro y redondeo en forma de U (Centrado)
// (d,h,u) = (diámetro,altura,largo de vaciado)
module RedU(d,h,u){ 
		// Taladro vertical
		translate([(d/2)+(u-d)/2, 0, 0])
		cube([u, d, h],center=true);
		// Vaciado en forma de U
		translate([0, 0, -h/2])
		rotate( 90, [0, 0, 1])
		cylinder(h = h, r = d/2, $fn=100);
}

// Vaciado en forma de U para el tornillo
module taladro(){
	// Vaciado en forma de U (Vertical)
	translate([10, 23, 8])
	rotate( 90, [0, 0, 1])
	RedU(dPas,17,8);
	// Vaciado en forma de U (Inclinado)
	translate([10, 25.2, 6.819])
	rotate(-35.75, [1,0,0])
	rotate( 90, [0, 0, 1])
	RedU(dPas,25,8);
}

// Vaciado y chaflán
module vaciochaflan(){
	// Vaciado plano
	translate([-1, -1, 6])
	cube([22, 7, 11]);
	// Vaciado chaflán
	translate([-1, 6, 6])
	rotate(55, [1,0,0])
	cube([22, 15, 8]);
}

// Tope para la varilla lisa
module tope(){	
	// Tope de soporte de la varilla lisa
	translate([7, -1, -1])
	cube([6, 2, 8]);
	// Chaflán a 45º
	translate([7, 1, -1])
	rotate(225, [0,0,1])
	cube([2, 2, 8]);
	// Chaflán a 45º
	translate([13, 1, -1])
	rotate(225, [0,0,1])
	cube([2, 2, 8]);
	// Vaciado interior del tope
	translate([3, 3.5, -1])
	cube([14, 2.5, 8]);
}

// Creamos la pieza a partir del bloque y todas sus operaciones
module pieza(){
	// Bloque principal de la pieza
	difference() {
		bloque();
		union() {
			taladro();
			vaciochaflan();
			tope();
		}
	}
}

// Generamos la pieza!!

	pieza();
