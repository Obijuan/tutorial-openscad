render(convexity = 10)
difference() {
union() {
linear_extrude(height = 3)
import(file = "obijuan-academy-logo.dxf", layer = "base");

//color("red")
linear_extrude(height = 10)
import(file = "obijuan-academy-logo.dxf", layer = "A");
}

linear_extrude(height = 30, center = true)
import(file = "obijuan-academy-logo.dxf", layer = "hole");

}