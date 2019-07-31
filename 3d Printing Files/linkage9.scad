
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

$fn = 32;

module poly_path1813(h)
{
    difference()
    {
       linear_extrude(height=h)
         circle(d = 8);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
         circle(d = 3);
    }
}

module inkscape(h)
{

poly_path1813(h);
}

inkscape(3);
