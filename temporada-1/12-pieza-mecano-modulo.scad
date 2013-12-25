//----------------------------------------------------------
//-- Tutorial OpenScad
//-- Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//----------------------------------------------------------
//-- (c) Mayo, 2012
//-- Licencia GPL
//----------------------------------------------------------
//-- Ejemplo 1: Pieza de mecano
//-- Pieza basica de mecano, parametrizada, en un modulo
//-- y con parmaetros por defecto
//----------------------------------------------------------

module pieza_mecano(n=4, drill=4, d=10, anchura=10, grosor=3)
{
  //-- Calcular al longitud de la pieza
  lx = n*d;

  //-- Construir la pieza
  difference() {
    //-- Cuerpo de la pieza
    cube([lx,anchura,grosor],center=true);

    //-- Taladros
    translate([-lx/2+d/2,0,0])
      for (i=[0:n-1]) {
        translate([i*d,0,0])
          cylinder(r=drill/2, h=grosor+5, $fn=20,center=true);
     }
  }
}

//-- Ejemplos de utilizacion
pieza_mecano();

translate([0,20,0])
  pieza_mecano(n=2);
