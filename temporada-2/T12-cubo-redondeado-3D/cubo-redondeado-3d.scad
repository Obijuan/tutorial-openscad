//-- Constantes para acceder a las coordenadas X,Y,Z de los vectores
X = 0;
Y = 1;
Z = 2;

//-- Parámetros del cubo redondeado
r = 4;              //-- Radio de las curvas
A = [30, 30, 20];   //-- Dimensiones del cubo

//-- Calcular las coordenadas en funcion de los parametros del user
a = (A - [2*r, 2*r, 2*r])/2;

//-- Obtener las coordenadas. Es un atajo para no escribir tanto
x = a[X];
y = a[Y];
z = a[Z];

//-- Calcular los vertices del cubo
vertice = [
  [x, y, z],
  [-x, y, z],
  [-x, -y, z],
  [x, -y, z],
  [x, y, -z],
  [-x, y, -z],
  [-x, -y, -z],
  [x, -y, -z],
];

//-- Cubo de comprobacion. Mismas dimensiones pero sin 
//-- redondear. El redondeado debe tener las mismas dimensiones
%cube(A, center = true);

//-- Dibujar el cubo redondeado. Se coloca en cada vertice una
//-- esfera de radio r y se aplica el operador hull
hull() 
  for (pos = vertice)
    translate(pos)
      sphere(r = r, $fn = 20);
      


