

//-- Parametros
r = 5;    //-- Radio del redondeo de las esquinas
h = 10;   //-- Altura

//-- Coordenadas del cilindro del primer cuadrante
cx = 20;
cy = 15;

//-- Vector de puntos, con las posiciones de los cilindros
POINT = [
  [cx, cy, 0],    //-- Punto 0
  [-cx, cy, 0],   //-- Punto 1
  [-cx, -cy, 0],  //-- Punto 2
  [cx, -cy, 0],   //-- Punto 3
  [2*cx, 0, 0],   //-- Punto 4
  [0, 1.5*cy, 0], //-- Punto 5
  [0,0,h],        //-- Punto 6
];  


//-- Obtener el menor objeto convexo que contiene
//--   los cilindros situados en los puntos indicados en 
//-- el vector POINT

%hull() {

  //-- Dibujar cada cilindro en su posicion correspondiente
  for (pos = POINT) 
    translate(pos)
      cylinder(r = r, h = h, center = true, $fn = 20);
}


//-- Dibujar cada cilindro en su posicion correspondiente
  for (pos = POINT) 
    translate(pos)
      cylinder(r = r, h = h, center = true, $fn = 20);