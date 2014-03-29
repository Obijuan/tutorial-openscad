anchura_cm = 10;

color("red")
scale([anchura_cm, anchura_cm, 1])
linear_extrude(height = 5)
import("rebel.dxf");
