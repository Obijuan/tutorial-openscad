step = 3;
min = 5;

module zigurat(n)
{
  if (n <= 1) {
	cube([min, min, step], center = true);
  }
  else {
    cube([n * min, n * min, step], center = true);
	translate([0, 0, step])
	  zigurat(n - 1);
  }
}	

zigurat(10);