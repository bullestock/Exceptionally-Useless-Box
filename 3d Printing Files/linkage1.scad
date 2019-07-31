
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

module poly_path865(h)
{
  scale([25.4/96, -25.4/96, 1]) union()
  {
    difference()
    {
       linear_extrude(height=h)
         polygon([[-63.571694,-21.982448],[-56.530575,-17.419536],[-48.976200,-13.555968],[-41.019369,-10.384455],[-32.770884,-7.897710],[-24.341545,-6.088445],[-15.842152,-4.949371],[-7.383505,-4.473201],[0.923594,-4.652648],[8.028202,-5.276133],[14.844740,-6.242792],[21.378061,-7.536917],[27.633020,-9.142799],[33.614471,-11.044730],[39.327267,-13.227002],[44.776264,-15.673907],[49.966314,-18.369735],[54.902272,-21.298780],[59.588992,-24.445332],[68.234135,-31.328127],[75.940575,-38.892454],[82.747144,-47.012648],[84.274034,-48.647072],[86.128798,-50.029099],[88.232404,-51.137360],[90.505818,-51.950485],[92.870007,-52.447106],[95.245940,-52.605852],[97.554583,-52.405356],[99.716904,-51.824248],[101.547400,-50.913654],[103.230679,-49.652776],[104.735555,-48.103827],[106.030839,-46.329023],[107.867886,-42.350707],[108.347275,-40.271625],[108.492324,-38.215548],[108.132593,4.766152],[108.871454,38.583452],[108.641691,41.127723],[107.867445,43.651471],[106.594947,46.051891],[104.870426,48.226177],[102.740113,50.071523],[100.250239,51.485121],[97.447032,52.364166],[94.376724,52.605852],[91.072583,52.188167],[88.156544,51.232557],[85.651132,49.819792],[83.578869,48.030640],[81.962280,45.945871],[80.823888,43.646254],[80.186218,41.212558],[80.071794,38.725552],[80.284588,32.217435],[80.187863,26.375515],[79.948274,13.704252],[79.562485,10.637344],[78.437946,8.230421],[76.741817,6.444114],[74.641260,5.239052],[72.303438,4.575866],[69.895512,4.415184],[67.584643,4.717636],[65.537994,5.443852],[51.319673,12.726918],[44.025290,16.032384],[35.963600,18.915002],[26.651738,21.225671],[15.606837,22.815287],[2.346028,23.534748],[-13.613555,23.234952],[-22.668421,22.520457],[-31.669111,21.247332],[-40.578576,19.383046],[-49.359766,16.895065],[-57.975632,13.750858],[-66.389123,9.917891],[-74.563191,5.363634],[-82.460786,0.055552],[-83.924267,-0.668896],[-85.683738,-1.189110],[-87.783471,-1.607948],[-92.899352,-2.615073],[-97.126554,-3.931045],[-99.025238,-4.808777],[-100.539795,-5.839348],[-103.947468,-9.410030],[-106.729978,-13.642935],[-107.763924,-15.925786],[-108.494133,-18.275871],[-108.871454,-20.660416],[-108.846739,-23.046648],[-108.285109,-26.188812],[-107.268767,-29.251993],[-105.835113,-32.165861],[-104.021549,-34.860085],[-101.865478,-37.264336],[-99.404301,-39.308284],[-96.675419,-40.921597],[-93.716234,-42.033948],[-90.496731,-42.761589],[-87.617100,-43.099968],[-85.022977,-43.081490],[-82.659999,-42.738560],[-80.473802,-42.103585],[-78.410021,-41.208971],[-74.432255,-38.770448],[-72.621849,-37.108485],[-71.193717,-35.080541],[-68.978491,-30.409223],[-66.775007,-25.721516],[-65.361552,-23.673088],[-63.571694,-21.982448]]);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
           polygon([[100.448794,38.131552],[100.105583,36.589953],[99.386736,35.212715],[98.338588,34.066019],[97.007471,33.216048],[95.500765,32.742595],[93.948613,32.676636],[92.431497,33.011129],[91.029899,33.739034],[89.866606,34.807243],[89.033510,36.118531],[88.564747,37.599675],[88.494454,39.177452],[88.837665,40.719051],[89.556511,42.096290],[90.604660,43.242986],[91.935777,44.092956],[93.442483,44.566410],[94.994635,44.632369],[96.511751,44.297875],[97.913349,43.569971],[99.076641,42.501762],[99.909738,41.190473],[100.378501,39.709329],[100.448794,38.131552],[100.448794,38.131552]]);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
           polygon([[100.069644,-38.667448],[99.728155,-40.210943],[99.010147,-41.590208],[97.962018,-42.738829],[96.630167,-43.590396],[95.122218,-44.064825],[93.568665,-44.131014],[92.050216,-43.796025],[90.647576,-43.066920],[89.483855,-41.996991],[88.651135,-40.683796],[88.183574,-39.200795],[88.115334,-37.621448],[88.456822,-36.077952],[89.174831,-34.698688],[90.222960,-33.550067],[91.554811,-32.698500],[93.062760,-32.224071],[94.616312,-32.157882],[96.134762,-32.492870],[97.537402,-33.221975],[98.701122,-34.291904],[99.533843,-35.605100],[100.001404,-37.088101],[100.069644,-38.667448],[100.069644,-38.667448]]);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
           polygon([[-76.317981,-23.235548],[-76.746641,-25.491892],[-77.590323,-27.554573],[-78.799631,-29.382144],[-80.325170,-30.933157],[-82.117543,-32.166164],[-84.127355,-33.039718],[-86.305210,-33.512372],[-88.601712,-33.542678],[-90.858056,-33.114018],[-92.920738,-32.270336],[-94.748308,-31.061028],[-96.299321,-29.535490],[-97.532328,-27.743116],[-98.405882,-25.733304],[-98.878536,-23.555450],[-98.908842,-21.258948],[-98.259981,-18.345981],[-96.901391,-15.743640],[-94.920626,-13.576957],[-92.405234,-11.970968],[-89.558100,-11.076415],[-86.625112,-10.951817],[-83.758327,-11.583870],[-81.109804,-12.959268],[-78.911531,-14.977682],[-77.337132,-17.455425],[-76.451113,-20.254160],[-76.317981,-23.235548],[-76.317981,-23.235548]]);
    }
  }
}

module inkscape(h)
{

poly_path865(h);
}

inkscape(3);
