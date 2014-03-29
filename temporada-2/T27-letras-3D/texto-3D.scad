use <write/write.scad>

grosor = 10;
size = 20;

translate([0, size*1.5, 0])
write("OBIJUAN",t=grosor,h=size,center=true);

color("red")
write("ACADEMY", t = grosor, h = size, center = true);

color("gray")
translate([0, -size * 2, 0])
write ("GRACIAS :-)", t = grosor, h = size, center = true);
