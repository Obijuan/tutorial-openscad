//-- Parametros del trapecio
B = 40; //-- Base larga
b = 20; //-- Base corta
h = 15; //-- Altura


//-- Rotar prisma para apoyarlo en plano xy
rotate([90, 0, 0])

//-- Extrusion lineal del trapecio
linear_extrude(height = 80, center = true)

  //-- Trapecio
  polygon(points = [
          [-B/2, -h/2],
	  	  [-b/2, h/2],
          [b/2,  h/2],
          [B/2, -h/2]
          ]);


