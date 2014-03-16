
//-- Ejemplo 1: Extrusion lineal con giro
*linear_extrude(height = 50, twist = 90, $fn = 100)
  square(size = [10,20],center = true);

//--- Extrusion axial  
//-- Ejemplo 2: Objeto de "revolucion": toro
rotate_extrude($fn = 100)
translate([20, 0, 0])
//circle(d = 20, center = true); 
square([20, 20], center = true);