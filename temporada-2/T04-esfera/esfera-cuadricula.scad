//-- Ejemplo de uso de esferas para visualizar una cuadrícula
//-- de N x N cuadros

//-- Tamaño de cada cuadro
d = 30;

//-- Radio de las esferas en la cuadrícula
r = 2;

//-- Número de cuadros  (N x N)
N = 10;

//-- Tamaño total de la cuadrícula
size = N * d;    

//-- Dibujar la cuadricula
translate([-size / 2, -size / 2, 0])  //-- Centrar cuadricula
for (ix = [0:N])    //-- Esferas en eje x
  for (iy = [0:N])  //-- Esferas en eje y 
    //-- Posicionar la esfera en punto (ix, iy)
    translate([ix * d, iy * d, 0])
      sphere(r = r, $fn=20);

//-- Objeto ejemplo en punto (2, 2): una esfera roja      
translate([2 * d, 2 * d, 0])
color("red")      
sphere(r = 15, $fn = 20);

//-- Objeto ejemplo en punto (-3, -4): un cubo azul
color("blue")
translate([-3 * d, -4 * d, 0])
  cube([20, 20, 20], center = true);