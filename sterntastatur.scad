// variables
fs = 2;  // roughly the size of straight parts of curves
w1 = 2.4;   // cookie cutter, thicker side
w2 = 0.8;   // cookie cutter, thinner side
w3 = 0.8;   // star carve
w4 = 0.4;   // keyboard carve
h = 15;     // cookie cutter height
dt = 2;     // dough thickness at carve, 0 for cut
sc = 80;    // diameter of cookie

// model
// circle
circle_ish(sc/2, 365);
// star
p1 = [0.179, -0.15]*sc;
p2 = [0.24, -0.336]*sc;
p3 = [0, -0.157]*sc;
p4 = [-0.24, -0.333]*sc;
p5 = [-0.181, -0.15]*sc;
straight_line2(p1, p2);
straight_line2(p3, p2);
straight_line2(p3, p4);
straight_line2(p5, p4);
p6 = [-0.28, 0.04833]*sc;
p7 = [-0.39, 0.12833]*sc;
p8 = [-0.0917, 0.12667]*sc;
p9 = [0, 0.41167]*sc;
p10 = [0.0917, 0.12667]*sc;
p11 = [0.39, 0.12833]*sc;
p12 = [0.3616, 0.10833]*sc;
straight_line2(p6, p7);
straight_line2(p8, p7);
straight_line2(p8, p9);
straight_line2(p10, p9);
straight_line2(p10, p11);
straight_line2(p12, p11);
// keys
// numpad
translate([-0.3475, 0.0115]*sc)key(0.026, 0.027);
translate([-0.3475, -0.035]*sc)key(0.026, 0.059);
translate([-0.3475, -0.0976]*sc)key(0.026, 0.059);
for(x = [-0.2555, -0.2856, -0.3164], y = [0.0115, -0.0196, -0.051, -0.082])
    translate([x, y]*sc)key(0.0265, 0.027);
translate([-0.3164, -0.1142]*sc)key(0.026, 0.027);
translate([-0.2705, -0.1142]*sc)key(0.0555, 0.027);
// f keys
for(x = [-0.21, -0.1775, -0.145, -0.101, -0.069, -0.0355, -0.004, 0.041, 0.0735, 0.1057, 0.138, 0.181, 0.213, 0.2465, 0.279, 0.34], y = [0.073])
    translate([x, y]*sc)key(0.028, 0.029);
// arrow section
for(x = [-0.2072, -0.177, -0.1452], y = [0.0115, -0.0196])
    translate([x, y]*sc)key(0.026, 0.027);
for(x = [-0.2075, -0.177, -0.1457], y = [-0.1134])
    translate([x, y]*sc)key(0.027, 0.028);
translate([-0.177, -0.0798]*sc)key(0.027, 0.028);
// 1st row
translate([-0.0825, 0.0118]*sc)key(0.053, 0.027);
for(x = [-0.037, -0.0055, 0.026, 0.057, 0.0885, 0.12, 0.151, 0.1825, 0.214, 0.2455, 0.277, 0.308], y = [0.0118])
    translate([x, y]*sc)key(0.0245, 0.027);
translate([0.34, 0.0118]*sc)key(0.0255, 0.027);
// 2nd row
translate([-0.0903, -0.0197]*sc)key(0.039, 0.027);
for(x = [-0.052, -0.0208, 0.0105, 0.042, 0.0735, 0.1048, 0.1363, 0.1675, 0.1989, 0.23, 0.2615, 0.293], y = [-0.0197])
    translate([x, y]*sc)key(0.025, 0.027);
translate([0.3327, -0.0197]*sc)key(0.04, 0.027);
// 3rd row
translate([-0.078, -0.0513]*sc)key(0.062, 0.027);
for(x = [-0.028, 0.0035, 0.0345, 0.066, 0.0975, 0.129, 0.16, 0.1915, 0.223, 0.2542, 0.2855], y = [-0.0513])
    translate([x, y]*sc)key(0.0245, 0.027);
translate([0.329, -0.0513]*sc)key(0.048, 0.027);
// 4th row
translate([-0.0707, -0.083]*sc)key(0.077, 0.027);
for(x = [-0.013, 0.01805, 0.0497, 0.081, 0.1125, 0.144, 0.1755, 0.2065, 0.238, 0.2694], y = [-0.083])
    translate([x, y]*sc)key(0.025, 0.027);
translate([0.321, -0.083]*sc)key(0.0645, 0.027);
// 5th row
for(x = [-0.089, -0.0118, 0.252, 0.3327], y = [-0.114])
    translate([x, y]*sc)key(0.04, 0.027);
translate([0.12, -0.114]*sc)key(0.2095, 0.027);

// floor
linear_extrude(2) 
    polygon(points=[p1 + [w1/2,0,0], p1 - [w1/2,0,0],[w1/2, -w1/2], p3 + [w1/2,0,0], p3 - [w1/2,0,0], [-w1/2, -w1/2], p5 + [w1/2,0,0], p5 - [w1/2,0,0], [p5[0]-w1/2 , -0.1142*sc], [-0.2705, -0.1142]*sc, p6, [-0.21*sc, 0.073*sc], [-0.21*sc, p7[1]], p8 + [w1/2,0,0], [p8[0] + w1/2, 0.073*sc], [p10[0] - w1/2, 0.073*sc], p10 - [w1/2,0,0], p11, p12, [p12[0], 0.0118]]);
for(i = [0 : 72 : 360]) rotate([0, 0, i])
    linear_extrude(2) polygon(points=[[w1/2, p9[1]], [-w1/2, p9[1]], [-w1/2, sc/2], [w1/2, sc/2]]);

// functions and modules
function fn_circle(r, angle) = round((PI *r*angle)/(180*fs));

module shape() cylinder(h, w1/2, w2/2, $fn=12);
module shape2() cylinder(h-dt, w1/2, w3/2, $fn=12);
module shape3() cylinder(h-dt, w1/2, w4/2, $fn=12);

module straight_line(a, b)  // a and b are points/vectors
    hull(){ 
       translate(a) shape();
       translate(b) shape();
    }
module straight_line2(a, b)  // a and b are points/vectors
    hull(){ 
       translate(a) shape2();
       translate(b) shape2();
    }
module straight_line3(a, b)  // a and b are points/vectors
    hull(){ 
       translate(a) shape3();
       translate(b) shape3();
    }
    
module circle_ish(r, angle, fn)     // r = radius, fn is optional
    let(fn=fn_circle(r, angle), interval = angle/fn)
        for (i= [0:interval:(angle-interval)]) 
            hull(){
                translate([cos(i)*r, sin(i)*r, 0]) shape(); 
                translate([cos(i+interval)*r, sin(i+interval)*r, 0]) shape(); 
            }
    
module key(x, y)            // x,y: width and height of crosses
    {straight_line3([x/2*sc-w4/2, y/2*sc-w4/2], [-x/2*sc+w4/2, -y/2*sc+w4/2]);
    straight_line3([x/2*sc-w4/2, -y/2*sc+w4/2], [-x/2*sc+w4/2, y/2*sc-w4/2]);}
        