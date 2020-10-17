// variables
w1 = 2.4;   // cookie cutter, thicker side
w2 = 0.8;   // cookie cutter, thinner side
h = 15;     // cookie cutter height

// model
rotate([0, 0, 90])circle_ish(35, 217, 35);
rotate([0, 0, -90])circle_ish(19, 135, 15);
rotate([0, 0, 45])circle_ish(30.5, 45, 15);
rotate([0, 0, 270])circle_ish(28, 39, 15);
straight_line([0, 35], [0, 30.5]);
rotate([0, 0, -45])straight_line([0, 19], [0, 30.5]);
straight_line([0, -28], [0, -19]);
rotate([0, 0, -53])straight_line([35, 0], [28, 0]);

// functions and modules
module shape() cylinder(h, w1/2, w2/2, $fn=12);

module straight_line(a, b)
    hull(){ 
       translate(a) shape();
       translate(b) shape();
    };
    
module circle_ish(r, angle, fn) 
 let (interval = angle/fn)
    for (i= [0:interval:(angle-interval)]) 
        hull(){
            translate([cos(i)*r, sin(i)*r, 0]) shape(); 
            translate([cos(i+interval)*r, sin(i+interval)*r, 0]) shape(); 
        };
