// Created from Code_Ybelt_holderB.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

//Características del tornillo
dTor = 6.3;		// Diámetro de la rosca (6.3)
hHex = 10;		// Altura entre caras planas de la tuerca (5.8)

// Media Pieza
module mpieza(){
	// Base (X)
	cube([10.5, 5, 16]);
	// Altura (Y)
	translate([5, -9, 0])
	cube([5.5, 9, 16]);
	// Saliente (X)
	translate([5, -9, 0])
	cube([13.5, 7, 16]);
	// Diente
	translate([14.5, -1.5, 0])
	rotate( 225 ,[0, 0, 1])
	cube([1, 1, 16]);
}

// Operaciones para media pieza
module moperaciones(){
	// Chaflán interior
	translate([5, -7, -1])
	rotate( 225 ,[0, 0, 1])
	cube([3, 3, 18]);
	// Chaflán exterior 
	translate([18.5, -5, -1])
	rotate( 206.57 ,[0, 0, 1])
	cube([10, 4, 18]);
	// Vaciado interior para el paso de la correa 
	translate([5, -7.5, 4])
	rotate( 45 ,[0, 0, 1])
	cube([10, 2, 8]);
}

// Generar un hexágono circunscrito (Diametro,altura) 
module hexagono(d,h){ 
	for (a = [0, 60,120]){ 
		rotate( a, [0, 0, 1])
		cube([d, d*tan(30), h], center = true);
	}
}

// Alojamiento de la tuerca y taladro para el tornillo
module tuerca(){
	// Taladro para el tornillo
	translate([0, -1, 8])
	rotate( -90, [1, 0, 0])
	cylinder(h = 7, r = dTor/2, $fn=100);
	// Hueco para la tuerca 
	translate([0, -3.5, 8])
	rotate( 90, [1, 0, 0])
	rotate( 90, [0, 0, 1])
	hexagono(hHex, 11);
}

// Creamos la pieza a partir de las operacione
module pieza(){
	difference () {
		union() {
			// Pieza situada en +X
			mpieza();
			// Pieza situada en -X
			mirror([ 1, 0, 0 ])
			mpieza();
		}	
		union() {
			// Operaciones situadas en +X
			moperaciones();
			// Operaciones situadas en -X
			mirror([ 1, 0, 0 ])
			moperaciones();
	
			// Operaciones únicas
			tuerca();

		}// Union end	
	}// diff. end
}// module end


// Generamos la pieza!!

	pieza();


