
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

module poly_path873(h)
{
  scale([25.4/96, -25.4/96, 1]) union()
  {
    difference()
    {
       linear_extrude(height=h)
         polygon([[-74.124584,-14.400000],[74.675414,-14.400000],[77.285653,-14.155761],[79.859915,-13.436672],[82.301175,-12.248546],[84.512404,-10.597200],[86.396577,-8.488447],[87.856668,-5.928103],[88.795649,-2.921982],[89.116494,0.524100],[88.756977,3.405397],[87.780012,6.053330],[86.287807,8.420751],[84.382568,10.460512],[82.166502,12.125466],[79.741817,13.368464],[77.210719,14.142358],[74.675414,14.400000],[3.021353,14.129588],[-74.124584,14.400000],[-76.793385,14.062727],[-79.451013,13.086219],[-81.989509,11.572945],[-84.300915,9.625375],[-86.277275,7.345977],[-87.810630,4.837219],[-88.793022,2.201570],[-89.116494,-0.458500],[-88.721036,-3.016176],[-87.687853,-5.514047],[-86.124588,-7.865588],[-84.138885,-9.984275],[-81.838390,-11.783584],[-79.330745,-13.176991],[-76.723595,-14.077971],[-74.124584,-14.400000]]);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
           polygon([[-68.124584,0.000000],[-68.332277,-1.565506],[-68.928431,-3.000000],[-69.872662,-4.233532],[-71.124584,-5.196153],[-72.584198,-5.799038],[-74.124584,-6.000000],[-75.664970,-5.799038],[-77.124584,-5.196153],[-78.376506,-4.233532],[-79.320737,-3.000000],[-79.916891,-1.565506],[-80.124584,0.000000],[-79.916891,1.565506],[-79.320737,3.000000],[-78.376506,4.233532],[-77.124584,5.196153],[-75.664970,5.799038],[-74.124584,6.000000],[-72.584198,5.799038],[-71.124584,5.196153],[-69.872662,4.233532],[-68.928431,3.000000],[-68.332277,1.565506],[-68.124584,0.000000]]);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
           polygon([[80.675414,0.000000],[80.467721,-1.565506],[79.871567,-3.000000],[78.927336,-4.233532],[77.675414,-5.196152],[76.215800,-5.799038],[74.675414,-6.000000],[73.135028,-5.799038],[71.675414,-5.196152],[70.423493,-4.233532],[69.479262,-3.000000],[68.883107,-1.565506],[68.675414,0.000000],[68.883107,1.565506],[69.479262,3.000000],[70.423493,4.233532],[71.675414,5.196152],[73.135028,5.799038],[74.675414,6.000000],[76.215800,5.799038],[77.675414,5.196152],[78.927336,4.233532],[79.871567,3.000000],[80.467721,1.565506],[80.675414,0.000000],[80.675414,0.000000]]);
    }
  }
}

module inkscape(h)
{

poly_path873(h);
}

inkscape(3);
