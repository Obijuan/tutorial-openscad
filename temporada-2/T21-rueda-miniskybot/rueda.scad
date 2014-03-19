//-- Parametros de la rueda
di = 50;  //-- Diametro interno de la junta torica
ds = 3;  //-- Diametro de la junta torica
h = ds + 2;   //-- Grosor de la rueda


//-- Parametros calculados
d = di + 2 * ds;  //-- Diametro rueda
r1 = d / 2; //-- Radio de la rueda
r2 = ds / 2;  //-- Radio de la junta toria

//-- Seccion de la rueda
module section()
{

  difference() {
    translate([r1 / 2, 0, 0])
      square([r1, h], center = true);

    //-- Para alojamiento circular
    *translate([r1, 0, 0])
      circle(d = 3, $fn = 20);

 
    //-- Para alojamiento triangular
     translate([r1 - r2, 0, 0])
       polygon(points = [[0, 0], 
                        [r2 + 1, r2 + 1],
                        [r2 + 1, -r2 - 1],
                        ]);
  }
}


//-- Junta torica
module junta()
{
  rotate_extrude($fn = 100)
  translate([r1, 0, 0])
    circle(d = ds);
}

//-- Rueda
difference() {
  rotate_extrude(convexity = 10, $fn = 100)
  section();

  //-- Eje de la rueda
  cylinder(d = 3, h = h + 10, center = true, $fn = 20);
}

color("grey")
junta();

