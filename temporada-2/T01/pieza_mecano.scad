module pieza_mecano(drill=3, d=10, n=4, anchura=10, grosor=3)
{

  //-- Calcular la longitud de la pieza
  lx = n*d;

  //-- Construimos la pieza
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
color("blue")
pieza_mecano(n = 10);

color("green")
translate([0,20,0])
  pieza_mecano(n=4);

