//----------------------------------------------------------
//-- Tutorial OpenScad
//-- Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//----------------------------------------------------------
//-- (c) Mayo, 2012
//-- Licencia GPL
//----------------------------------------------------------
//-- Rueda modularizada con parametros por defecto
//----------------------------------------------------------

module rueda_simple(grosor=5, diametro=40, diam_eje=8)
{
  //-- Construcción de la rueda a partir de
  //-- los parámetros
  difference() {
    //-- Base de la rueda
    cylinder(r=diametro/2, h=grosor,$fn=100);

    //-- Taladro del eje
    cylinder(r=diam_eje/2, h=3*grosor,$fn=20,center=true);
  }
}

//-- Ejemplos de utilizacion
rueda_simple();

translate([50,0,0])
   rueda_simple(grosor=20);

translate([-50,0,0])
  rueda_simple(diametro=20, grosor=10);



