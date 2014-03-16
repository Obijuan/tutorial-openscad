//-- Parametros de la rueda
d = 50;  //-- Diametro rueda
ds = 3;
b = ds/2;
h = ds + 2;  //-- Grosor


difference() {
  cylinder(d = d, h = h, center = true, $fn = 100);

  //color("blue")
  rotate_extrude(convexity = 10, $fn = 100)
  translate([d/2 - b, 0, 0])
  polygon(points = [[0, 0], 
                    [b + 1, b + 1],
                    [b + 1, -b - 1],
                   ]);
  cylinder(d = 3, h = h + 1, center = true, $fn = 20);
  
}



