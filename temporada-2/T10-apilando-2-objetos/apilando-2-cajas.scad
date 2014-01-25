//-- Definiciones para acceder a las componentes X,Y,Z
//-- Aunque las definimos todas, en este ejemplo solo
//-- accedemos a la componente Z de los cubos
X = 0;
Y = 1;
Z = 2;


//-- Dimensiones de los cubos. Se pueden cambiar por el usuario
//-- Todo se recalculara para que B esté siempre encima de A
A = [30, 30, 10];
B = [10, 10, 30];

//-- Calcular la posicion de B para que este encima de A
posB = [0, 0, B[Z]/2 + A[Z]/2];


//---- Construccion de la figura a partir de los datos calculados!
//-- Poner el cubo B encima del A

//-- Poner el cubo A (es la base)
cube(A, center = true);

//-- Cubo B, encima de A
translate(posB)
  cube(B, center = true);