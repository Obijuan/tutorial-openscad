//----------------------------------------------------------
//-- Tutorial OpenScad
//-- Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//----------------------------------------------------------
//-- (c) Mayo, 2012
//-- Licencia GPL
//----------------------------------------------------------
//-- Ejemplo sencillo de como utilizar los modulos
//-- Construccion de un coche simple
//----------------------------------------------------------

use <rueda_simple.scad>

//-- Chasis del cohe
translate([30,0,0])
cube([100,60,10],center=true);

//-- Rueda delantera izquierda
translate([0,-30,0])
  rotate([90,0,0])
    rueda_simple();

//-- Rueda trasera izquierda
translate([60,-30,0])
  rotate([90,0,0])
    rueda_simple(grosor=20, diametro=50);

//-- Lado derecho del coche. Es simetrico con respecto
//-- al izquierdo
mirror([0,1,0]) {
  //-- Rueda delantera derecha
  translate([0,-30,0])
    rotate([90,0,0])
      rueda_simple();

  //-- Rueda trasera derecha
  translate([60,-30,0])
    rotate([90,0,0])
      rueda_simple(grosor=20, diametro=50);
}
