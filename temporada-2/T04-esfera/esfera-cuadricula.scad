
d = 30;
r = 2;

N = 10;

size = N * d;    

translate([-size / 2, -size / 2, 0])
for (ix = [0:N]) 
  for (iy = [0:N]) 
    translate([ix * d, iy * d, 0])
      sphere(r = r, $fn=20);

translate([2 * d, 2 * d, 0])
color("red")      
sphere(r = 15, $fn = 20);

color("blue")
translate([-3 * d, -4 * d, 0])
  cube([20, 20, 20], center = true);