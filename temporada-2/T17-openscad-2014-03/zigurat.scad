//-- Ejemplo de figura recursiva
//-- Piramide escalonada
//-- Utilizar Openscad 2014.03 o superior

//-- Parametros
step = 3; //-- Altura de cada nivel
min = 5;  //-- Dimensiones de la parte superior (ultimo nivel)

//-- Modulo recursivo
//-- n: Numero de niveles de la piramide
module zigurat(n)
{

  //-- Terminacion: en el nivel uno se situa el cubo superior (pequeño)
  if (n <= 1) {
	cube([min, min, step], center = true);
  }
  else {
    //-- Dibujar el cubo del nivel n
    cube([n * min, n * min, step], center = true);

    //-- Colocar encima una piramide de n-1 niveles (recursion)
	translate([0, 0, step])
	  zigurat(n - 1);
  }
}	

//-- Piramide de 10 niveles
zigurat(10);