// variables
fs = 0.5;  // roughly the size of straight parts of curves
w1 = 2.4;   // cookie cutter, thicker side
w2 = 0.8;   // cookie cutter, thinner side
h = 12;     // cookie cutter height
dt = 3;     // dough thickness carve, '0' for cut

// frame
translate([30, 30])circle_ish(10, 90, 25);
translate([-30, 30])rotate([0, 0, 90])circle_ish(10, 90, 25);
translate([-30, -25])rotate([0, 0, 180])circle_ish(10, 90, 25);
translate([30, -25])rotate([0, 0, 270])circle_ish(10, 90, 25);
straight_line([30, 40], [-30, 40]);
straight_line([30, -35], [-30, -35]);
straight_line([40, 30], [40, -25]);
straight_line([-40, 30], [-40, -25]);

// logo (ohne "eG")
straight_line2([11, -18.2], [8.1, -27.6]);
straight_line2([5.8, -20.8], [8.1, -27.6]);
straight_line2([5.8, -20.8], [3.5, -27.6]);
straight_line2([1.4, -20.8], [3.5, -27.6]);
straight_line2([6.8, -18.8], [-6.4, -18.8]);
straight_line2([-0.8, -27.7], [-0.8, -18.8]);
straight_line2([-4, -27.7], [-4, -21]);
straight_line2([-8.7, -21], [-4, -21]);
straight_line2([-8.3, -24.4], [-4, -24.4]);

// left unicorn
straight_line2([0, -7.3], [-23.3, -25.15]);
straight_line2([-33.4, -27.7], [-23.3, -25.15]);
straight_line2([-33.4, -27.7], [-9.9, -2.1]);
straight_line2([0, -7.3], [-9.9, -2.1]);
straight_line2([0, 8.7], [-9.9, -2.1]);
straight_line2([-13.2, 11], [-9.9, -2.1]);
straight_line2([-13.2, 11], [-8.1, 20.7]);
straight_line2([0, 8.7], [-8.1, 20.7]);
straight_line2([-13.3, 24.7], [-8.1, 20.7]);
straight_line2([-13.3, 24.7], [-15.8, 12.5]);
straight_line2([-13.2, 11], [-15.8, 12.5]);
straight_line2([-21.7, 19.4], [-15.8, 12.5]);
straight_line2([-23.25, 13.65], [-15.8, 12.5]);
straight_line2([-22.8, 7.65], [-15.8, 12.5]);
straight_line2([-22.65, 5.5], [-15.8, 12.5]);
straight_line2([-22.65, 5.5], [-22.8, 7.65]);
straight_line2([-22.65, 5.5], [-24, 5.6]);
straight_line2([-24, 5.6], [-22.8, 7.65]);
straight_line2([-24.8, 6], [-22.8, 7.65]);
straight_line2([-25.8, 8], [-22.8, 7.65]);
straight_line2([-25.8, 8], [-24.8, 6]);
straight_line2([-25.8, 8], [-23.25, 13.65]);
straight_line2([-23.25, 13.65], [-21.7, 19.4]);
straight_line2([-21.7, 19.4], [-17.8, 23.7]);
translate([-19.2, 19.5])circle_ish2(0.8, 360,4);
straight_line2([-17.8, 23.7], [-13.3, 24.7]);
straight_line2([-17.8, 23.7], [-13.3, 24.7]);
straight_line2([-14.8, 25.5], [-14.8, 24.8]);
straight_line2([-16.3, 25.3], [-16, 24.2]);
straight_line2([-16, 27.4], [-16.3, 25.3]);
straight_line2([-16, 27.4], [-14.8, 25.5]);
straight_line2([-19.8, 21.8], [-34, 32.85]);
straight_line2([-21.5, 20], [-34, 32.85]);

// right unicorn
mirror([1, 0, 0]){
straight_line2([0, -7.3], [-23.3, -25.15]);
straight_line2([-33.4, -27.7], [-23.3, -25.15]);
straight_line2([-33.4, -27.7], [-9.9, -2.1]);
straight_line2([0, -7.3], [-9.9, -2.1]);
straight_line2([0, 8.7], [-9.9, -2.1]);
straight_line2([-13.2, 11], [-9.9, -2.1]);
straight_line2([-13.2, 11], [-8.1, 20.7]);
straight_line2([0, 8.7], [-8.1, 20.7]);
straight_line2([-13.3, 24.7], [-8.1, 20.7]);
straight_line2([-13.3, 24.7], [-15.8, 12.5]);
straight_line2([-13.2, 11], [-15.8, 12.5]);
straight_line2([-21.7, 19.4], [-15.8, 12.5]);
straight_line2([-23.25, 13.65], [-15.8, 12.5]);
straight_line2([-22.8, 7.65], [-15.8, 12.5]);
straight_line2([-22.65, 5.5], [-15.8, 12.5]);
straight_line2([-22.65, 5.5], [-22.8, 7.65]);
straight_line2([-22.65, 5.5], [-24, 5.6]);
straight_line2([-24, 5.6], [-22.8, 7.65]);
straight_line2([-24.8, 6], [-22.8, 7.65]);
straight_line2([-25.8, 8], [-22.8, 7.65]);
straight_line2([-25.8, 8], [-24.8, 6]);
straight_line2([-25.8, 8], [-23.25, 13.65]);
straight_line2([-23.25, 13.65], [-21.7, 19.4]);
straight_line2([-21.7, 19.4], [-17.8, 23.7]);
translate([-19.2, 19.5])circle_ish2(0.8, 360,4);
straight_line2([-17.8, 23.7], [-13.3, 24.7]);
straight_line2([-17.8, 23.7], [-13.3, 24.7]);
straight_line2([-14.8, 25.5], [-14.8, 24.8]);
straight_line2([-16.3, 25.3], [-16, 24.2]);
straight_line2([-16, 27.4], [-16.3, 25.3]);
straight_line2([-16, 27.4], [-14.8, 25.5]);
straight_line2([-19.8, 21.8], [-34, 32.85]);
straight_line2([-21.5, 20], [-34, 32.85]);};

// pattern that connects image to frame
for (i=[-27:9:30]) 
    {translate([i-w1/2, -35, 0])cube([w1, 75, 2]);
    translate([-40+w1/4, i-w1/2, 0])cube([80-w1/2, w1, 2]);};    

// functions and modules
module shape() cylinder(h, w1/2, w2/2, $fn=15);
module shape2() cylinder(h-dt, w1/2, w2/2, $fn=15);

module straight_line(a, b)
    hull(){ 
       translate(a) shape();
       translate(b) shape();
    };
module straight_line2(a, b)
    hull(){ 
       translate(a) shape2();
       translate(b) shape2();
    };
    
module circle_ish(r, angle, fn) 
 let (interval = angle/fn)
    for (i= [0:interval:(angle-interval)]) 
        hull(){
            translate([cos(i)*r, sin(i)*r, 0]) shape(); 
            translate([cos(i+interval)*r, sin(i+interval)*r, 0]) shape(); 
        };
module circle_ish2(r, angle, fn) 
 let (interval = angle/fn)
    for (i= [0:interval:(angle-interval)]) 
        hull(){
            translate([cos(i)*r, sin(i)*r, 0]) shape2(); 
            translate([cos(i+interval)*r, sin(i+interval)*r, 0]) shape2(); 
        };
