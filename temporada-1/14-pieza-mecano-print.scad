//----------------------------------------------------------
//-- Tutorial OpenScad
//-- Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//----------------------------------------------------------
//-- (c) Mayo, 2012
//-- Licencia GPL
//----------------------------------------------------------
//-- Ejemplo 1: Pieza de mecano
//-- Se colocan 3 piezas de mecano para su impresion
//----------------------------------------------------------

use <pieza_mecano.scad>

pieza_mecano();

translate([0,15,0])
  pieza_mecano(n=3);

translate([0,30,0])
  pieza_mecano(n=2);


