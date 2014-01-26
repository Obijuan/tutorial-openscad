//-- Definiciones para acceder a las componentes X,Y,Z
//-- Aunque las definimos todas, en este ejemplo solo
//-- accedemos a la componente Z de los cubos
X = 0;
Y = 1;
Z = 2;


//-- Dimensiones de los cubos. Se pueden cambiar por el usuario
//-- Todo se recalculara para que todos los cubos esten apilados
A = [30, 30, 10];
B = [10, 10, 30];
C = [6, 6, 10];
D = [3, 3, 3];

//-- Calcular las posicion de los cubos para que esten apilados
posB = [0, 0, B[Z]/2 + A[Z]/2];
posC = posB + [0, 0, C[Z]/2 + B[Z]/2];
posD = posC + [0, 0, D[Z]/2 + C[Z]/2];


//---- Construccion de la figura a partir de los datos calculados!

//-- Poner el cubo A (es la base)
cube(A, center = true);

//-- Cubo B, encima de A
translate(posB)
  cube(B, center = true);
  
//-- Poner el cubo C encima del B
translate(posC)
  cube(C, center = true);
  
translate(posD)
  cube(D, center = true);