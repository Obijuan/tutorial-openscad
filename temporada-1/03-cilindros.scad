//----------------------------------------------------------
//-- Tutorial OpenScad
//-- Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//----------------------------------------------------------
//-- (c) Mayo, 2012
//-- Licencia GPL
//----------------------------------------------------------
//-- Ejemplo de figuras hechas con "cilindros"
//----------------------------------------------------------

//-- Moneda
translate([-50,0,0])
  cylinder(r=40/2, h=5, $fn=100);

//-- Hexágono
cylinder(r=40/2, h=5, $fn=6);

//-- Triángulo equilátero
translate([50,0,0])
  cylinder(r=40/2, h=5, $fn=3);


