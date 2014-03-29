h1 = 3;
h2 = 6;

linear_extrude(height = h1)
import(file = "logo.dxf", layer = "capa1");

color("red")
linear_extrude(height = h2)
import(file = "logo.dxf", layer = "capa2");

