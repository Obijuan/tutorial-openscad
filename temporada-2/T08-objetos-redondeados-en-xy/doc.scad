
//-- Parametros de la caja
lx = 50;  //-- Longitud en eje x
ly = 40;  //-- Longitud en eje y
r = 5;    //-- Radio del redondeo de las esquinas
h = 10;   //-- Altura

//-- Coordenadas del cilindro del primer cuadrante
cx = lx/2 - r;
cy = ly/2 - r;

//-- Posicion de los 4 cilindros de las esquinas
P1 = [cx, cy, 0];
P2 = [-cx, cy, 0];
P3 = [-cx, -cy, 0];
P4 = [cx, -cy, 0];


//-- Obtener el menor objeto convexo que contiene
//--   los 4 cilindros
%hull() {
  translate(P1)
    cylinder(r = r, h = h, center = true, $fn = 20);
    
  translate(P2)
    cylinder(r = r, h = h, center = true, $fn = 20);
    
  translate(P3)
    cylinder(r = r, h = h, center = true, $fn = 20);
    
  translate(P4)
    cylinder(r = r, h = h, center = true, $fn = 20);  
}

//-- Mostrar cilindros en amarillo
translate(P1)
    cylinder(r = r, h = h+0.2, center = true, $fn = 20);
    
translate(P2)
    cylinder(r = r, h = h+0.2, center = true, $fn = 20);
    
translate(P3)
    cylinder(r = r, h = h+0.2, center = true, $fn = 20);
    
translate(P4)
    cylinder(r = r, h = h+0.2, center = true, $fn = 20);
    
//-- Mostrar centro de la parte superior de los cilindros
color("red")
translate(P1 + [0,0,h/2])
  sphere(r = 0.5, $fn = 20);
  
  
color("red")
translate(P2 + [0,0,h/2])
  sphere(r = 0.5, $fn = 20); 
  
  
color("red")
translate(P3 + [0,0,h/2])
  sphere(r = 0.5, $fn = 20); 
  
  
color("red")
translate(P4 + [0,0,h/2])
  sphere(r = 0.5, $fn = 20);
  