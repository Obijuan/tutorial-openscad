//----------------------------------------------------------
//-- Tutorial OpenScad
//-- Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//----------------------------------------------------------
//-- (c) Mayo, 2012
//-- Licencia GPL
//----------------------------------------------------------
//-- Ejemplo de cómo hacer taladros
//----------------------------------------------------------

//-- Rueda simple
difference() {
  //-- Base de la rueda
  cylinder(r=50/2, h=5,$fn=100);

  //-- Taladro de 8mm
  cylinder(r=8/2, h=20,$fn=20,center=true);
}


