// Created from Nuevo_Code_Xcarriage - A.stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

include <Code_Config.scad>;

/**************************/
// Parámetros de la pieza  /
/**************************/

// Características de las tuerca
dTaTu = 3.3 ;	// Diámetro del taladro (3.3)
hCaTu = 5.5 ; 	// Distancia entre caras de la tuerca (5.5)


// Separador de los cojinetes lineales
// (Diámetro, Anchura , Distancia de corte {0 = media luna} )
module medialuna(d,h,w){
	difference(){
		// Cilindro
		rotate( 90, [0, 1, 0])
		cylinder(h = h, r = d/2);
		// Corte
		translate([-1, -d/2 - 1, -w])
		cube([h + 2, d + 2, d/2 + 1 + w]);
	}
}

// Soporte cilíndrico de los cojinetes lineales
module soportecojili(){
	// Separadores de los cojinetes
	medialuna(dCoLi, 2, 6.1);
	
	translate([27.2, 0, 0])
	medialuna(dCoLi, 3.6, 6.1);
	
	translate([56, 0, 0])
	medialuna(dCoLi, 2, 6.1);
	
	difference(){
		union(){
			hull(){
				// Cilindro base
				rotate( 90, [0, 1, 0])
				cylinder(h = 58, r = 11.1);
				// Aplanado lateral
				translate([0, -11.1, 0])
				cube([58, 11.1, 11.1]);
			}
		}
		union(){
			// Vaciado interior
			translate([-1, 0, 0])
			rotate( 90, [0, 1, 0])
			cylinder(h = 60, r = dCoLi/2);
			// Corte a 60º
			translate([-1, 5.73, 0])
			rotate( 60 , [1, 0, 0])
			cube([60, 10, 10]);
			// Corte vertical
			translate([-1, -7.5, 0])
			cube([60, 10, 12]);
		}
	}
}

// Hueco para la sujeción de la brida
module brida(){
	difference(){
		// Rectangulo base
		translate([0, -10.462, -2])
		cube([11, 20.924, 4]);
		union(){
			// Vaciado cilíndrico
			translate([-3, 0, -3])
			cylinder(h = 6, r = 9.5);
			// Chaflanes
			translate([4, 11.16, -3])
			chamfer(11,6,3);
			translate([4, -11.16, -3])
			chamfer(11,6,3);
		}
	}
}

// Base rectangular con dos chaflanes
module baserec(){
	// Separadores para el cojinete
	translate([14, 29, 1.2])
	cube([2, 20, 6]);
	translate([42, 29, 1.2])
	cube([2, 20, 6]);
	difference(){
		// Base + Chaflanes
		difference(){
			// Pieza base
			cube([58, 52, 8]);
			// Chaflanes
			union(){
				translate([14, 52, -1])
				chamfer(20,10,1);
				translate([44, 52, -1])
				chamfer(20,10,3);
			}
		}
		// Operaciones
		union(){
			// Taladros para el paso del tornillo
			translate([14, 6.35, -1])
			cylinder(h = 10, r = dTaTu/2);
			translate([44, 6.35, -1])
			cylinder(h = 10, r = dTaTu/2);
			// Alojamiento para las tuercas
			translate([14, 6.35, 0])
			rotate( 30, [0, 0, 1])
			hexagono(hCaTu,6);
			translate([44, 6.35, 0])
			rotate( 30, [0, 0, 1])
			hexagono(hCaTu,6);
			// Vaciado
			translate([48.5, 11.6, -2])
			cube([10.5, 9.8, 12]);
			// Hueco de paso para la brida
			translate([29, 38, -1])
			rotate( -90, [0, 1, 0])
			brida();
			// Carril para el cojinete lineal
			translate([-1, 38, -4])
			rotate( 90, [0, 1, 0])
			cylinder(h = 60, r = dCoLi/2);
		}
	}
}

// Soporte para la correa
module correa(){
	difference(){
		hull(){
			// Altura
			cube([3, 10, 14]);
			// Base
			cube([14, 10, 1]);
			// Chaflán
			translate([3, 0, 14])
			rotate( 135 , [0, 1, 0])
			cube([3, 10, 16]);
		}
		union(){
			// Muescas para las correas
			translate([0, 3, -1])
			cylinder(h = 16, r = 1.5);
			translate([0, 7, -1])
			cylinder(h = 16, r = 1.5);
		}
	}
}

// Unimos los diferentes módulos que forman la pieza
// Y aplicamos algunas operaciones comunes
module pieza(){
	difference(){
		union(){
			// Base rectangular preformada
			baserec();
			// Soporte cilíndrico preformado
			translate([58, -7.5, -4])
			rotate( 180, [0, 0, 1])
			soportecojili();
			// Soporte para la correa
			translate([50, 11.5, 5])
			rotate( 180, [0, 0, 1])
			rotate( 180, [1, 0, 0])
			correa();
		}
		union(){
			// Alojamiento para la tuerca del soporte de la correa
			translate([40, 13.5, -8])
			cube([3, 6, 20]);
			// Cilindro pasador del soporte de los cojinetes
			translate([29, 5, -9])
			rotate( 90, [1, 0, 0])
			cylinder(h = 25, r = 1.5);
		}
	}
}

// Generamos la pieza!!

	pieza();	
