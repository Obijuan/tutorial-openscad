
//-- Cilindro normal. r es el radio, h es la altura
*cylinder (r = 20, h = 20, $fn = 100);

//-- Cono truncado. r1 radio base inferior, r2 radio de la base superior
*cylinder (r1 = 20, r2 = 10, h = 20, $fn = 100);

//-- Cono
*cylinder (r1 = 20, r2 = 0, h = 20, $fn = 100);

//-- Piramide truncada de base hexagonal
*cylinder (r1 = 20, r2 = 10, h = 20, $fn = 6);

//-- Piramide
*cylinder (r1 = 20, r2 = 0, h = 20, $fn = 4);

//-- Tetraedro
cylinder (r1 = 20, r2 = 0, h = 20, $fn = 3);


