
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

factor = 96/25.4;

module poly_path873(h)
{
  scale([25.4/96, -25.4/96, 1]) union()
  {
    difference()
    {
      translate([-67.5, 0, h-fudge]) cylinder(h=h, r=24);
      translate([-77.5, -6.8, h-fudge]) cube([6*factor, 3.5*factor, h+2*fudge]);
    }
    difference()
    {
       linear_extrude(height=h)
         polygon([[-34.407014,-14.450794],[77.080104,-14.540794],[79.720117,-14.268063],[82.351990,-13.457282],[84.860193,-12.147694],[87.129201,-10.378544],[89.043487,-8.189076],[90.487522,-5.618532],[91.345780,-2.706157],[91.502734,0.508806],[90.984140,3.575420],[89.931539,6.299240],[88.428472,8.659118],[86.558481,10.633906],[84.405108,12.202456],[82.051893,13.343621],[79.582378,14.036254],[77.080104,14.259206],[20.719264,14.041406],[-30.999984,14.259206],[-37.243458,14.475368],[-40.340171,14.834291],[-43.382764,15.468306],[-46.387240,16.459004],[-49.295689,17.729218],[-54.946594,20.659206],[-58.870515,22.419011],[-62.650394,23.508574],[-66.270265,23.980804],[-69.714160,23.888607],[-72.966113,23.284892],[-76.010155,22.222567],[-78.830320,20.754540],[-81.410640,18.933718],[-83.735149,16.813010],[-85.787879,14.445324],[-87.552862,11.883567],[-89.014132,9.180648],[-90.155722,6.389474],[-90.961663,3.562954],[-91.415990,0.753995],[-91.502734,-1.984494],[-91.219703,-4.563829],[-90.579564,-7.133095],[-89.601646,-9.654605],[-88.305282,-12.090673],[-86.709803,-14.403610],[-84.834539,-16.555730],[-82.698821,-18.509346],[-80.321981,-20.226769],[-77.723351,-21.670314],[-74.922260,-22.802293],[-71.938040,-23.585019],[-68.790022,-23.980804],[-65.497537,-23.951961],[-62.079917,-23.460803],[-58.556492,-22.469644],[-54.946594,-20.940794],[-50.235559,-18.760982],[-45.377374,-16.944094],[-39.959034,-15.265257],[-37.200894,-14.675462],[-34.407014,-14.450794]]);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
           polygon([[29.458054,-0.140794],[29.262538,-1.620684],[28.699636,-2.976863],[27.807525,-4.143147],[26.624381,-5.053350],[25.244776,-5.623427],[23.788764,-5.813453],[22.332752,-5.623427],[20.953146,-5.053350],[19.770003,-4.143147],[18.877892,-2.976863],[18.314990,-1.620684],[18.119474,-0.140794],[18.314990,1.339095],[18.877892,2.695274],[19.770003,3.861558],[20.953146,4.771762],[22.332752,5.341838],[23.788764,5.531864],[25.244776,5.341838],[26.624381,4.771762],[27.807525,3.861558],[28.699636,2.695274],[29.262538,1.339095],[29.458054,-0.140794],[29.458054,-0.140794]]);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
           polygon([[14.339944,-0.140794],[14.144852,-1.621074],[13.582179,-2.977690],[12.690112,-4.144405],[11.506837,-5.054981],[10.126974,-5.625303],[8.670655,-5.815410],[7.214335,-5.625303],[5.834472,-5.054981],[4.651198,-4.144405],[3.759131,-2.977690],[3.196458,-1.621074],[3.001366,-0.140794],[3.196458,1.339485],[3.759131,2.696101],[4.651198,3.862816],[5.834472,4.773393],[7.214335,5.343714],[8.670655,5.533821],[10.126974,5.343714],[11.506837,4.773393],[12.690112,3.862816],[13.582179,2.696101],[14.144852,1.339485],[14.339944,-0.140794],[14.339944,-0.140794]]);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
           polygon([[83.080104,-0.140794],[82.872411,-1.706300],[82.276256,-3.140794],[81.332025,-4.374327],[80.080104,-5.336947],[78.620490,-5.939833],[77.080104,-6.140794],[75.539718,-5.939833],[74.080104,-5.336947],[72.828182,-4.374327],[71.883951,-3.140794],[71.287797,-1.706300],[71.080104,-0.140794],[71.287797,1.424711],[71.883951,2.859206],[72.828182,4.092738],[74.080104,5.055358],[75.539718,5.658244],[77.080104,5.859206],[78.620490,5.658244],[80.080104,5.055358],[81.332025,4.092738],[82.276256,2.859206],[82.872411,1.424711],[83.080104,-0.140794]]);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
           polygon([[-61.250604,-0.140794],[-61.445956,-1.620835],[-62.008770,-2.977183],[-62.900864,-4.143633],[-64.084058,-5.053982],[-65.463763,-5.624153],[-66.919894,-5.814210],[-68.376025,-5.624153],[-69.755730,-5.053982],[-70.938925,-4.143633],[-71.831019,-2.977183],[-72.393832,-1.620835],[-72.589184,-0.140794],[-72.393832,1.339246],[-71.831019,2.695594],[-70.938925,3.862044],[-69.755730,4.772393],[-68.376025,5.342564],[-66.919894,5.532621],[-65.463763,5.342564],[-64.084058,4.772393],[-62.900864,3.862044],[-62.008770,2.695594],[-61.445956,1.339246],[-61.250604,-0.140794],[-61.250604,-0.140794]]);
    }
  }
}

module inkscape(h)
{

poly_path873(h);
}

inkscape(3);
