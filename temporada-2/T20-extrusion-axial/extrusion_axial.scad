//-- Parametros del toroide
ri = 10;
ds = 10;

//-- Toroide, de seccion un hexagono
*rotate_extrude($fn = 100)
translate([ds/2 + ri, 0, 0])
circle(d = ds, $fn = 6);

//-- Toroide, cuya seccion es la la union de
//-- varios objetos 2D
rotate_extrude($fn = 100)
translate([ds/2 + ri, 0, 0]) {
  translate([ds/2, 0, 0])
  circle(d = ds);
  square([ds,ds], center = true);
}
