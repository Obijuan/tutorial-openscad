// Created from Code_EndStop (x2).stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

dBar = 8.1;		// Diámetro de la varilla (8.1)

//Características del tornillo 
dTor = 3.3;		// Diámetro de la rosca (3.3)
dCab = 5.6;		// Diámetro de la cabeza (5.6)
hHex = 5.9;		// Altura entre caras planas de la tuerca (5.9)

//Características del final de carrera
hEnd = 13.6;	// Altura (13.6)
wEnd = 5.8;		// Anchura (5.8)
dEnd = 5;		// Profundidad (5)


// Media Pieza a trabajar 
module mpieza(){
	translate([0, 3, 0])
	cube([9, 27, 10]);

	translate([6, 3, 0])
	cylinder(h = 10, r = 3, $fn=100);

	translate([1.5, 0, 0])
	cube([4.5, 3.9, 10]);
}

// Zócalo para el final de carrera 
module endstop(){
	// Hueco del final de carrera
	translate([0, 2.8, 10-dEnd])
	cube([hEnd/2, wEnd, dEnd+1]);
	// Medio cilindro 
	translate([(hEnd/2)-1, 2.8+wEnd, 10-dEnd])
	cylinder(h = dEnd+1, r = 1, $fn=100);
	// Vaciado inferior 
	translate([0, 3.9, -1])
	cube([hEnd/2, wEnd-2.3, 12-dEnd]);
	// Corte de la pestaña
	translate([0, 2.798, -1])
	cube([1.5, 1.2, 12-dEnd]);
}

module soporte(){
	// Taladro de la varilla
	translate([0, 19, -1])
	cylinder(h = 12, r = dBar/2, $fn=100);

	// Vaciado para la inserción de la varilla 
	// Parte plana
	translate([-1, 25, -1])
	cube([(dBar/2)+1, 6, 12]);
	//Parte en ángulo
	translate([dBar/2, 25, -1])
	rotate( 172.1, [0, 0, 1])
	cube([(dBar/2)+1, 6, 12]);


	// Corte en forma de U del centro de la varilla
	// Parte cilíndrica 
	translate([4.1569, 16.6, -1])
	cylinder(h = 12, r = 1, $fn=100);
	// Parte plana 
	translate([3.6569, 15.7339, -1])
	rotate( 60, [0, 0, 1])
	cube([2, 6, 12]);	
}


// Conjunto de operaciones para media pieza
module moperaciones(){

	endstop();

	soporte();

	// Taladro para el tornillo
	translate([0, 25.8, 5])
	rotate( 90, [0, 1, 0])
	cylinder(h = 11, r = dTor/2, $fn=100);
}

// Generar un hexágono circunscrito (Diametro,altura) 
module hexagono(d,h){ 
	for (a = [0, 60,120]){ 
		rotate( a, [0, 0, 1])
		cube([d, d*tan(30), h], center = true);
	}
}

// Alojamiento de la cabeza del tornillo 
module tcab(){ 
	translate([7, 25.8, 5])
	rotate( 90, [0, 1, 0])
	cylinder(h = 3, r = dCab/2, $fn=100);
}

// Alojamiento de la tuerca
module tuerca(){ 
	translate([-9, 25.8, 5])
	rotate( 90, [0, 1, 0])
	rotate( 90, [0, 0, 1])
	hexagono(hHex, 3);
}

// Creamos la pieza a partir de  las operaciones
module pieza(){ 
	difference () {
		union() {
			// Media pieza en {x,y} = {+,+}
			mpieza();

			// Media pieza en {x,y} = {-,+}
			mirror([ 1, 0, 0 ])
			mpieza();
		}	
		union() {
			// Operaciones en {x,y} = {+,+}
			moperaciones();
			
			// Operaciones en {x,y} = {-,+}
			mirror([ 1, 0, 0 ])
			moperaciones();

			// Operaciones unicas para cada lado
			
			// Alojamiento de la cabeza del tornillo 
			// en {x,y} = {+,+}
			tcab();

			// Alojamiento de la tuerca en {x,y} = {-,+}
			tuerca();

		}	
	}
}


// Generamos la pieza!!

	pieza();


