e = 1;  // roughly the size of straight party of curves
w1 = 2.4;   // cookie cutter, thicker side
w2 = 0.8;   // cookie cutter, thinner side
h = 15;     // cookie cutter height
mh = 2;     // thickness of connection to window
sw = 18;    // size of window
dt = 2;     // dough thickness at the window carve, '0' for cut

// points for shape and bezier curves
p1 = [20, 0];
p2 = [20, 14.5];
p3 = [20, 21];
p4 = [7.8, 28.2];
p5 = [5.6, 0];
p6 = [-5.6, 0];
p7 = [33.7, 0];
p8 = [33.7, 25];
p9 = [32, 43];
p10 = [19.5, 51];
p11 = [25, 88];
p12 = [15, 97];
p13 = [0, 103.8];

// actual model
curve(p1, p2, p3, p4);
mirror([1,0,0]) curve(p1, p2, p3, p4);
straightline(p4, p5);
mirror([1,0,0]) straightline(p4, p5);
straightline(p5, p6);
straightline(p1, p7);
mirror([1,0,0]) straightline(p1, p7);
curve(p7, p8, p9, p10);
mirror([1,0,0]) curve(p7, p8, p9, p10);
curve(p10, p11, p12, p13);
mirror([1,0,0]) curve(p10, p11, p12, p13);
difference(){
    union(){
        translate([-20,60, 0]) cube([40, sw/2 + 4, mh], false);
        translate([0,60 +sw/4 +2, 0]) cylinder(h-dt, (sw+w1-w2)/2, sw/2, false);
    };
    translate([0,60 +sw/4 +2, 0]) cylinder(3*h, sw/2-w2, sw/2-w2, true);
};
    
// functions and modules
function fn(a, b) = round(sqrt(pow(a[0]-b[0],2) + (pow(a[1]-b[1], 2)))/e);
    
module shape() cylinder(h, w1/2, w2/2, $fn=12);

function two_points(a, b, n, idx) = 
    a * n*idx 
    + b * (1-n*idx);

function three_points(a, b, c, n, idx) = 
    two_points(a, b, n, idx) * n*idx
    + two_points(b, c, n, idx) * (1-n*idx);

function four_points(a, b, c, d, n, idx) = 
    three_points(a, b, c, n, idx) * n*idx
    + three_points(b, c, d, n, idx) * (1-n*idx);
    
module curve(a, b, c, d) 
    let (idx=fn(a, d), n = 1/idx)
    for (i= [0:idx-1]) 
    hull(){ 
       translate(four_points(a, b, c, d, n, i)) shape();
       translate(four_points(a, b, c, d, n, i+1)) shape();
    };

module straightline(a, b)
    hull(){ 
       translate(a) shape();
       translate(b) shape();
    };