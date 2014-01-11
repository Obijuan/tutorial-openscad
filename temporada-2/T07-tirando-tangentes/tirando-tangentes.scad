//-------- Parametros de la pieza
r1 = 25;  //-- Radio cilindro 1
r2 = 10;  //-- Radio cilindro 2
th = 5;   //-- Grosor

//-- Distancia entre los centros de los cilincros
d = r1 + r2 + 10;

//-- Crear el objetco convexo minimo que contiene ls dos
//-- cilindros
hull() {

  //-- Cilindro 1
  translate([-d/2, 0, 0])
    cylinder(r = r1, h = th, center = true, $fn = 50);
    
  //-- Cilincro 2
  translate([d/2, 0, 0])
    cylinder(r = r2, h = th, center = true, $fn = 50);
}

