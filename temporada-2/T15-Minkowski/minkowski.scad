use <rcylinder.scad>

X = 0;
Y = 1;
Z = 2;

size = [20, 20, 10];
r = 2;

//-- Pieza de ejemplo, a la que aplicar Minkowski
module pieza()
{
  cube(size, center = true);
    
  translate([10,10,0])
    cube(size, center = true);
}

//-- Aplicar Minkowski a la pieza, usando diferentes objetos 
minkowski() {
  pieza();
  
  cylinder(r = r, h = 1, center = true, $fn = 10);
  //sphere(r = r, $fn = 10);
  //rcylinder(r = r, h = 2 * r, both = false, center = true, $fn = 10);
}

*pieza();

*color("red")
translate([-size[X]/2, 0, size[Z]/2])
cylinder(r = r, h = 1, center = true, $fn = 10);
//sphere(r = r, $fn = 10);
//rcylinder(r = r, h = 2 * r, both = false, center = true, $fn = 10);