
d = 50;

//-- Cilindro normal. r es el radio, h es la altura
translate([-d, d, 0])
  cylinder (r = 20, h = 20, $fn = 100);

//-- Cono truncado. r1 radio base inferior, r2 radio de la base superior
translate([0, d, 0])
 cylinder (r1 = 20, r2 = 10, h = 20, $fn = 100);

//-- Cono
translate([d, d, 0])
  cylinder (r1 = 20, r2 = 0, h = 20, $fn = 100);

//-- Piramide truncada de base hexagonal
translate([-d, 0, 0])
  cylinder (r1 = 20, r2 = 10, h = 20, $fn = 6);

//-- Piramide
translate([0, 0, 0])
  cylinder (r1 = 20, r2 = 0, h = 20, $fn = 4);

//-- Tetraedro
translate([d, 0, 0])
  cylinder (r1 = 20, r2 = 0, h = 20, $fn = 3);


