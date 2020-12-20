// variables
fs = 1;  // roughly the size of straight parts of curves
w1 = 2.4;   // cookie cutter, thicker side
w2 = 0.8;   // cookie cutter, thinner side
h = 15;     // cookie cutter height
dt = 2;     // dough carve, 0 for cut
sc = 80;    // width of cookie cutter
r = 10;     // radius of edges

// points
// TV
p1 = [0.483, 0.58]*sc;
p1a = [0.483, 0.61]*sc;
p2 = [0.467, 0.63]*sc;
p2a = [0.32, 0.655]*sc;
p3 = [0.14, 0.63]*sc;
p3a = [0.1, 0.5]*sc;
p4 = [0.14, 0.363]*sc;
p4a = [0.35, 0.355]*sc;
p5 = [0.467, 0.365]*sc;
p5a = [0.482, 0.4]*sc;
p6 = [0.483, 0.425]*sc;
// cables 1
p7 = [0.378, 0.615]*sc;
p7a = [0.36, 0.5]*sc;
p7b = [0.45, 0.55]*sc;
p7c = [0.68, 0.6]*sc;
p8 = [0.705, 0.47]*sc;

p9 = [0.28, 0.615]*sc;
p9a = [0.31, 0.57]*sc;
p10 = [0.36, 0.52]*sc;
p10a = [0.6, 0.51]*sc;
p10b = [0.65, 0.53]*sc;
p11 = [0.7, 0.47]*sc;

p12 = [0.27, 0.39]*sc;
p12a = [0.315, 0.45]*sc;
p13 = [0.36, 0.489]*sc;
p13a = [0.6, 0.49]*sc;
p13b = [0.65, 0.5]*sc;
p14 = [0.69, 0.47]*sc;

p15 = [0.375, 0.394]*sc;
p15a = [0.365, 0.49]*sc;
p15b = [0.4, 0.45]*sc;
p15c = [0.5, 0.46]*sc;
p16 = [0.69, 0.46]*sc;
// cables 2
p17 = [0.672, 0.555]*sc;
p17a = [0.72, 0.51]*sc;
p18 = [0.733, 0.455]*sc;

p19 = [0.71, 0.56]*sc;
p19a = [0.74, 0.515]*sc;
p20 = [0.758, 0.465]*sc;

p21 = [0.757, 0.545]*sc;
p21a = [0.78, 0.515]*sc;
p22 = [0.78, 0.48]*sc;
// cables 3
p23 = [0.8, 0.497]*sc;
p23a = [0.735, 0.42]*sc;
p24 = [0.656, 0.445]*sc;

p25 = [0.803, 0.475]*sc;
p25a = [0.755, 0.4]*sc;
p26 = [0.677, 0.413]*sc;

p27 = [0.81, 0.456]*sc;
p27a = [0.78, 0.375]*sc;
p28 = [0.69, 0.373]*sc;

p29 = [0.825, 0.425]*sc;
p29a = [0.805, 0.35]*sc;
p30 = [0.73, 0.343]*sc;
// cables 4
p31 = [0.806, 0.344]*sc;
p31a = [0.84, 0.28]*sc;
p32 = [0.905, 0.3]*sc;

p33 = [0.809, 0.348]*sc;
p33a = [0.87, 0.235]*sc;
p34 = [0.795, 0.187]*sc;

p35 = [0.74, 0.176]*sc;
p35a = [0.725, 0.174]*sc;
p36 = [0.71, 0.174]*sc;

p37 = [0.77, 0.324]*sc;
p37a = [0.755, 0.28]*sc;
p37b = [0.72, 0.27]*sc;
p38 = [0.717, 0.217]*sc;

p39 = [0.79, 0.081]*sc;
p39a = [0.725, 0.15]*sc;
p39b = [0.82, 0.24]*sc;
p40 = [0.77, 0.324]*sc;

// model
translate([sc*0.5, -sc*0.375])mirror([1, 0, 0]){
// frame
translate([sc-r, sc*0.75- r])circle_ish(r, 90);
translate([r, sc*0.75- r])rotate([0, 0, 90]) circle_ish(r, 90);
translate([r, r])rotate([0, 0, 180]) circle_ish(r, 90);
translate([sc-r, r])rotate([0, 0, 270]) circle_ish(r, 90);
straight_line([r, 0], [sc-r, 0]);
straight_line([r, sc*0.75], [sc-r, sc*0.75]);
straight_line([0, r], [0, sc*0.75- r]);
straight_line([sc, r], [sc, sc*0.75- r]);
// TV
b_curve2([p1, p1a, p2]);
b_curve2([p2, p2a, p3]);
b_curve2([p3, p3a, p4]);
b_curve2([p4, p4a, p5]);
b_curve2([p5, p5a, p6]);
// cables 1
b_curve2([p7, p7a, p7b, p7c, p8]);
b_curve2([p9, p9a, p10]);
b_curve2([p10, p10a, p10b, p11]);
b_curve2([p12, p12a, p13]);
b_curve2([p13, p13a, p13b, p14]);
b_curve2([p15, p15a, p15b, p15c, p16]);
// cables 2
b_curve2([p17, p17a, p18]);
b_curve2([p19, p19a, p20]);
b_curve2([p21, p21a, p22]);
//cables 3
b_curve2([p23, p23a, p24]);
b_curve2([p25, p25a, p26]);
b_curve2([p27, p27a, p28]);
b_curve2([p29, p29a, p30]);
// cables 4
b_curve2([p31, p31a, p32]);
b_curve2([p33, p33a, p34]);
b_curve2([p35, p35a, p36]);
b_curve2([p37, p37a, p37b, p38]);
b_curve2([p39, p39a, p39b, p40]);
// floor / grid
linear_extrude(w1) 
    polygon(points=[p1, p2, p2/2 + p3/2 + [0, 0.015*sc], p3, p3/2 + p4/2 - [0.025*sc, 0],  p4, p4/2 + p5/2 - [0, 0.005*sc], p5, p6, p24, p26, p28, p30, p38, p36, p39, p34, p32, p31, p29, p23, p21, p19, p17]);
for(i=[0.13, 0.45, 0.76])
translate([i, 0, 0]*sc)cube([w1, sc*0.75, w1]);
translate([0, 0.48, 0]*sc)cube([sc, w1, w1]);
translate([0, 0.2, 0]*sc)cube([sc, w1, w1]);
};

// functions and modules
// chaosknoten
function fn(a, b) = round(sqrt(pow(a[0]-b[0],2) + pow(a[1]-b[1], 2))/fs);

module shape2() cylinder(h-dt, w1/2, w2/2, $fn=12);

module b_curve2(pts)             // pts is an array of points
    let (idx=fn(pts[0], pts[len(pts)-1]), n = 1/idx){       
        for (i= [0:idx-1]) 
        hull(){ 
           translate(b_pts(pts, n, i)) shape2();
           translate(b_pts(pts, n, i+1)) shape2();          
        }
    }
    
function b_pts(pts, n, idx) =       // gets called by b_curve() ...
    len(pts)>2 ?                    // ... and b_curve_rainbow() 
        b_pts([for(i=[0:len(pts)-2])pts[i]], n, idx) * n*idx 
            + b_pts([for(i=[1:len(pts)-1])pts[i]], n, idx) * (1-n*idx)
        : pts[0] * n*idx 
            + pts[1] * (1-n*idx); 
        
// frame     
module shape() cylinder(h, w1/2, w2/2, $fn=12);

function fn_circle(r, angle) = round((PI *r*angle)/(180*fs));

module circle_ish(r, angle, fn)     // r = radius, fn is optional
    let(fn=fn_circle(r, angle), interval = angle/fn)
    for (i= [0:interval:(angle-interval)]) 
        hull(){
            translate([cos(i)*r, sin(i)*r, 0]) shape(); 
            translate([cos(i+interval)*r, sin(i+interval)*r, 0]) shape(); 
        }
        
module straight_line(a, b)  // a and b are points/vectors
    hull(){ 
       translate(a) shape();
       translate(b) shape();
    }
    