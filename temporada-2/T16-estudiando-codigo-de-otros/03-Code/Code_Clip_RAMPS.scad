// Created from Code_Clip_RAMPS.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

// Características del soporte 
hCen = 19.2;	// Altura del soporte central (19.2)
hClip = 4.8;	// Altura del clip respecto al soporte central (4.8)
wClip = 47;		// Anchura de clip a clip (interior)(47)

//Características del tornillo
dTor = 3.4;		// Diámetro de la rosca (3.4)
hHex = 5.7;		// Altura entre caras planas de la tuerca (5.7)

/**************************/
// Partes para media pieza /
/**************************/

// Bloque de la base del soporte
module base(){
	difference(){
		// Bloque
		cube([wClip/2+4, 6, 15]);
		// Vaciado inferior 
		translate([-1, -1, -1])
		cube([wClip/2-5, 3, 17]);
	}
}

// Bloque central del soporte
module centro(){
	difference(){
		// Bloque central
		translate([0, 5, 0])
		cube([4, hCen+1, 15]);
		// Chaflán a lo largo del eje Z
		translate([3, hCen+6, -1])
		rotate( -45 ,[0, 0, 1])
		cube([2, 1, 17]);
	}
}
// hCen+hClip
// Bloque del clip lateral
module clip(){
	difference(){
		// Cubo del clip a lo largo del eje Y
		translate([wClip/2, 0, 0])
		cube([4, hCen+hClip+10, 15]);
		// Chaflanes
		union(){
			// Chaflán superior
			translate([wClip/2, hCen+hClip+6, 14])
			rotate( 90 ,[1, 0, 0])
			rotate( 45 ,[0, 0, 1])
			cube([2, 1, hCen+hClip]);
			// Chaflán inferior 
			translate([wClip/2+1, hCen+hClip+6, 0])
			rotate( 90 ,[1, 0, 0])
			rotate( 135 ,[0, 0, 1])
			cube([2, 1, hCen+hClip]);
		}
	}
	// Extremo (duro) del clip
	difference(){
		translate([wClip/2-2, hCen+hClip+6, 0])
		cube([6, 4, 15]);
		// Chaflán 
		translate([wClip/2-2, hCen+hClip+6, -1])
		rotate( 63.43 ,[0, 0, 1])
		cube([5, 2, 17]);
	}
}

// Generar un hexágono circunscrito (Diametro,altura) 
module hexagono(d,h){ 
	for (a = [0, 60,120]){ 
		rotate( a, [0, 0, 1])
		cube([d, d*tan(30), h], center = true);
	}
}

// Alojamiento para el tornillo
module tornillo(){
	translate([wClip/2+0.65, 7, 7.5])
	rotate( 90, [1, 0, 0])
	union() {
		hexagono(hHex, 8);
		cylinder(h = 8, r = dTor/2, $fn=100);
	}
}

// Unimos tordas las partes para crear la media Pieza
module mpieza(){
	difference(){
		union(){
			// Bloque de la base del soporte
			base();
			// Bloque central del soporte
			centro();
			// Bloque del clip lateral
			clip();
		}
		// Alojamiento para el tornillo
		tornillo();
	}
}

// Unimos las dos mitades para crear la pieza entera
module pieza(){
	mpieza();
	mirror([ 1, 0, 0 ])
	mpieza();
}

/**************************/
//  Generamos las piezas   /
/**************************/

// Generamos la pieza
	
	pieza();

// Generamos otra pieza desplazada y simétrica

	translate([wClip/4, hCen+hClip+20, 0])
	mirror([ 0, 1, 0 ])
	pieza();

