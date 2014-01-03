//-- Organizador de canicas paramétrico

//-- Número de canicas
N = 3;

//-- Diametro de las canicas
dc = 16;

//-- Tamaño de cada cuadro
d = dc + 3;

//-- Tamaño total de la cuadrícula
size = (N-1) * d;    

//-- Tamaño de la caja donde están las canicas
size_box = N * d;
h_box = dc / 2 + 1;

difference() {
  //-- Caja de las canicas
  translate([0, 0, -h_box / 2])
  cube([size_box, size_box, h_box], center = true);

  //-- Canicas
  translate([-size / 2, -size / 2, 0])  //-- Centrar canicas
  for (ix = [0:N-1])    
    for (iy = [0:N-1]) 
      //-- Posicionar la canica en punto (ix, iy)
      translate([ix * d, iy * d, 0])
	sphere(r = dc/2, $fn=20);
}
