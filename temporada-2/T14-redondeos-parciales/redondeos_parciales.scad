use <rcylinder.scad>

X = 0;
Y = 1;
Z = 2;


//-- Parametros del cubo
size = [20, 20, 10];
r = 2;

//-- Calcular las coordenadas de la esquina del cuadrante 1
xc = size[X]/2 - r;
yc = size[Y]/2 - r;
zc = size[Z]/2;

//-- Tamaño de las columnas cuadradas
col_size = [2 * r, 2 * r, size[Z]];

//-- Posiciones de las columnas
vertex = [
  [xc, yc, 0],
  [-xc, yc, 0],
  [-xc, -yc, 0],
  [xc, -yc, 0],
];

//-- Ejemplo 1:  Modificacion de las aristas verticales
module example1() 
{

  hull() {
    for (v = [0:1]) 
      translate(vertex[v])
	cube(col_size, center = true);
	//cylinder(r = r, h = size[Z], center = true, $fn = 4);
	
    translate(vertex[2])
      cylinder(r = r, h = size[Z], center = true, $fn = 50);    
	
    translate(vertex[3])
      cylinder(r = r, h = size[Z], center = true, $fn = 4);
  }
}

//-- Ejemplo 2: Modificacion de las aristas horizontales y verticales
module example2()
{
  hull() {
  for (v = [0:3]) 
    translate(vertex[v])
      //cylinder(r = r, h = size[Z], center = true, $fn = 50);
      rcylinder(r = r, h = size[Z], both = false, center = true, $fn = 40);
      //rcylinder(r = r, h = size[Z], both = true, center = true, $fn = 40);
      
  }
}

//-- Ejemplos para probar

example1();
//example2();
