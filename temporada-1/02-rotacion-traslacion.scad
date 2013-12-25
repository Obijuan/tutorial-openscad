//----------------------------------------------------------
//-- Tutorial OpenScad
//-- Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//----------------------------------------------------------
//-- (c) Mayo, 2012
//-- Licencia GPL
//----------------------------------------------------------
//-- Ejemplo de translación y rotación
//----------------------------------------------------------

//-- Traslación y rotación de un cubo
rotate([0,0,30])
  translate([50,0,0])
    cube([20,20,20],center=true);

//-- rotación de un cubo
rotate([0,0,45])
  cube([20,20,10],center=true);



