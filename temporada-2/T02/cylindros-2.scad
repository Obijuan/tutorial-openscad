
//-- Cilindro normal
*cylinder(r = 20, h = 20, $fn = 100);

//-- Cono truncado. r1 base inferior. r2 base superior
*cylinder(r1 = 20, r2 = 10, h = 20, $fn = 100);

//-- Cono
*cylinder(r1 = 20, r2 = 0, h = 20, $fn = 100);

//-- Piramide truncada de base hexagonal
*cylinder(r1 = 20, r2 = 10, h = 20, $fn = 6);

//-- Piramide
*cylinder(r1 = 20, r2 = 0, h = 20, $fn = 4);

//-- tetraedro
cylinder(r1 = 20, r2 = 0, h = 20, $fn = 3);