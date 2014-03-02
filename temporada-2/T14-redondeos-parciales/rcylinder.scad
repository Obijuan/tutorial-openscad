//-- Cilindro redondeado en las tapas
//-- Parametros:
//-- r: radio del cilindro
//-- h: Altura del cilindro
//-- center : [true, false], centrar el cilindro
//-- both: [true, false]
//--    true: Redondear ambas tapas (superior e inferior)
//--    false: solo se redondea la tapa superior
module rcylinder(r = 4, 
                 h = 20, 
                 center = false, 
                 both = false, $fn = 30)
{

  //-- Calcular la altura del cilindro interior
  //-- Si redondeo por las dos tapas, vale h - 2*r
  //-- si solo una tapa entonces h - r
  hc = (both == true) ? h - 2 * r : h - r;
  
  //-- Calcular la traslacion para centrar el cilindro
  posc = (center == true) ? 0 : h/2;
  
  //-- Aplicar traslaciopn para el centrado
  translate([0, 0, posc]) 
  
    //-- Cilindro con ambas tapas redondeadas
    //-- Se pone un cilindro de altura hc y una esfera
    //-- en la parte superior y otra en la inferior
    if (both == true) {
      cylinder(r = r, h = hc, center = true, $fn = $fn);
      
      //-- Esferas superior e inferior
      for (i = [-1, 1])
        translate([0, 0, i * hc / 2])
          sphere(r = r);
          
    }
    //-- Cilindro con tapa superior redondeada
    else
      //-- Centrar la figura
      translate([0, 0, -h/2]) {
      
        //-- Cilindro + esfera
        cylinder(r = r, h = hc, $fn = $fn);
          translate([0, 0, hc]) sphere(r = r, $fn = $fn);
      }
        
}

//-- Parametros para los ejemplos
r = 5;
h = 30;
center = false;
$fn = 30;

//-- Cilindro normal
translate([-3*r, 0, 0])  
  cylinder(r = r, h = h, center = center, $fn = $fn);

//-- Cilindro con tapa superior redondeada
rcylinder(r = r, h = h, both = false, center = center, $fn = $fn);

//-- Cilindro con ambas tapas redondeadas
translate([3*r, 0, 0])  
  rcylinder(r = r, h = h, both = true, center = center, $fn = $fn);
  
  