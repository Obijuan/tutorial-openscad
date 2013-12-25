//----------------------------------------------------------
//-- Tutorial OpenScad
//-- Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//----------------------------------------------------------
//-- (c) Mayo, 2012
//-- Licencia GPL
//----------------------------------------------------------
//-- Rueda modularizada. Ejemplo de como definir modulos
//----------------------------------------------------------

module rueda_simple(grosor, diametro, diam_eje)
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

rueda_simple(diametro=50, grosor=5, diam_eje=8);

translate([50,0,0])
  rueda_simple(diametro=40, grosor=20, diam_eje=10);




