// Created from Code_Diagonal (x2).stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

dTalaX = 6.3;	//Diámetro del taladro del bloque X 

dTalaY = 6.4;	//Diámetro del taladro del bloque Y 


// Bloque a lo largo del eje X
module bloqueX(){
	// Bloque y taladro
	difference () {
		translate([0, -6, 0])
		cube([23, 6, 32]);
	
		translate([15, 1, 8])
		rotate( 90, [1, 0, 0])
		cylinder(h = 8, r = dTalaX/2, $fn=100);
	}

	// Esquina redondeada
	difference () {
		translate([0, -5, 0])
		cylinder(h = 32, r = 5, $fn=100);

		translate([-5, -10, -1])
		cube([10, 5, 34]);
	}	
}

// Bloque a lo largo del eje Y
module bloqueY(){
	// Bloque y taladro
	difference () {
		translate([0, -23, 0])
		cube([5, 23, 32]);

		translate([-1, -15, 20])
		rotate( 90, [0, 1, 0])
		cylinder(h = 7, r = dTalaY/2, $fn=100);
	}
}

// Redondeo entre los bloques X y Y
module redondeoXY(){
	difference () {
		cube([2, 2, 32]);
		
		translate([2, 0, -1])
		cylinder(h = 34, r = 2, $fn=100);
	}
}

// Unión de todos los bloques
module pieza(){
	difference () {
		union() {
			bloqueX();

			bloqueY();

			translate([5, -8, 0])
			redondeoXY();
		}	

		//Chaflan que afecta al bloqueX() y al redondeoXY()
		translate([23, -7, 10.56])
		rotate( 38, [0, -1, 0])
		cube([18, 8, 34]);	
	}
}

/**************************/
//  Generamos las piezas   /
/**************************/

// Pieza normal

	translate([0, 30, 0])
	pieza();

// Pieza simetrica

	translate([0, -30, 0])
	mirror([ 0, 1, 0 ]) 
	pieza();
