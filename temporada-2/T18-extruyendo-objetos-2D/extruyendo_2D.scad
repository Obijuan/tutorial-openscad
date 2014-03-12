
*linear_extrude(height = 50, twist = 0, slices = 20)
  //translate([10, 0, 0])
  square(size = [10,20],center = true);
  
rotate([0, 90, 0])  
rotate_extrude()
  translate([30, 0, 0])
  
  union() {
    translate([4,4,0])
      square(size = [10,20], center = true);
    square(size = [10,20],center = true);
  }  
  
*rotate_extrude()
//translate([2, 0, 0])
circle(r = 1);   