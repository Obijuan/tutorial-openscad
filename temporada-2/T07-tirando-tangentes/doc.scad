
r1 = 25;
r2 = 10;
th = 5;
d = r1 + r2 + 10;


%hull() {
  translate([-d/2, 0, 0])
    cylinder(r = r1, h = th, center = true, $fn = 50);
    
  translate([d/2, 0, 0])
    cylinder(r = r2, h = th, center = true, $fn = 50);
}


color("blue")
translate([-d/2, 0, 0])
  cylinder(r = 1, h = th + 1, center = true, $fn = 20);


translate([-d/2, 0, 0]) 
  cylinder(r = r1-0.03, h = th + 0.04, center = true, $fn = 50);

  
color("blue")
translate([d/2, 0, 0])
  cylinder(r = 1, h = th + 1, center = true, $fn = 20);
  
  translate([d/2, 0, 0]) 
  cylinder(r = r2-0.03, h = th + 0.04, center = true, $fn = 50);
