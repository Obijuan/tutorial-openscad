//----------------------------------------------------------
//-- Tutorial OpenScad
//-- Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//----------------------------------------------------------
//-- (c) Mayo, 2012
//-- Licencia GPL
//----------------------------------------------------------
//-- Ejemplo de modificadores para usarlo en la depuracion
//----------------------------------------------------------

difference() {

  //-- Pieza sin taladros
  union() {
    //-- Cuerpo
    color("blue")
    cube([167.8, 30, 5],center=true);

    //-- Torre derecha
    color("green")
    translate([167.8/2-20/2,0,13/2+5/2])
       cube([20,30,13],center=true);

    //-- Torre izquierda
    color("green")
    translate([-167.8/2+20/2,0,13/2+5/2])
      cube([20,30,13],center=true);
  }

  //-- Taladros
  #translate([-167.8/2+10,0,0])
    cylinder(r=9/2, h=50, center=true);

  #translate([+167.8/2-10,0,0])
    cylinder(r=9/2, h=50, center=true);
}

