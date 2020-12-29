// variables, all in mm
fs = 1;  // roughly the size of straight parts of curves
w1 = 2.4;   // cookie cutter, thicker side
w2 = 0.8;   // cookie cutter, thinner side
h = 15;     // cookie cutter height
dc = 3;     // dough cut
sc = 60;    // size of cookie

// model
// outside
straight_line([sc/2, sc/2], [sc/2, -sc/2]);
straight_line([-sc/2, sc/2], [-sc/2, -sc/2]);
straight_line([sc/2, -sc/2], [-sc/2, -sc/2]);
straight_line([sc/2, sc/2], [-sc/2, sc/2]);
// 3
translate([-0.315*sc, -0.313*sc])corner2();
translate([-0.414*sc, -0.313*sc])rotate([0, 0, 90])corner2();
translate([-0.421*sc, -0.385*sc])rotate([0, 0, 90])corner2();
translate([-0.421*sc, -0.42*sc])rotate([0, 0, 180])corner2();
translate([-0.414*sc, -0.345*sc])rotate([0, 0, 180])corner2();
translate([-0.315*sc, -0.42*sc])rotate([0, 0, 270])corner2();
straight_line2([-0.315*sc, -0.44*sc], [-0.421*sc, -0.44*sc]);
straight_line2([-0.315*sc, -0.293*sc], [-0.414*sc, -0.293*sc]);
straight_line2([-0.32*sc, -0.365*sc], [-0.421*sc, -0.365*sc]);
straight_line2([-0.441*sc, -0.385*sc], [-0.441*sc, -0.421*sc]);
straight_line2([-0.434*sc, -0.313*sc], [-0.434*sc, -0.345*sc]);
// C
translate([-0.115*sc, -0.313*sc])corner2();
translate([-0.115*sc, -0.42*sc])rotate([0, 0, 270])corner2();
straight_line2([-0.095*sc, -0.313*sc], [-0.095*sc, -0.42*sc]);
straight_line2([-0.245*sc, -0.293*sc], [-0.115*sc, -0.293*sc]);
straight_line2([-0.245*sc, -0.44*sc], [-0.115*sc, -0.44*sc]);
// R
translate([-0.022*sc, -0.313*sc])rotate([0, 0, 90])corner2();
translate([-0.022*sc, -0.358*sc])rotate([0, 0, 180])corner2();
straight_line2([-0.042*sc, -0.313*sc], [-0.042*sc, -0.358*sc]);
straight_line2([0.105*sc, -0.293*sc], [0.105*sc, -0.44*sc]);
straight_line2([0.105*sc, -0.293*sc], [-0.022*sc, -0.293*sc]);
straight_line2([0.105*sc, -0.378*sc], [-0.022*sc, -0.378*sc]);
straight_line2([0.022*sc, -0.378*sc], [-0.031*sc, -0.44*sc]);
// letter support
translate([-sc/2, -sc/2, 0])cube([sc, sc/4, 2]);

// functions and modules
module shape() cylinder(h, w1/2, w2/2, $fn=15);
module shape2() cylinder(h-dc, w1/2, w2/2, $fn=15);

module corner2() circle_ish2(0.02*sc, 90, 10);

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
    
module circle_ish2(r, angle, fn)   
    let (interval = angle/fn)
    for (i= [0:interval:(angle-interval)]) 
        hull(){
            translate([cos(i)*r, sin(i)*r, 0]) shape2(); 
            translate([cos(i+interval)*r, sin(i+interval)*r, 0]) shape2(); 
        }
    