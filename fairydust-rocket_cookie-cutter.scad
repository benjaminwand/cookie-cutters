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
b_curve([p1, p2, p3, p4]);
mirror([1,0,0]) b_curve([p1, p2, p3, p4]);
straight_line(p4, p5);
mirror([1,0,0]) straight_line(p4, p5);
straight_line(p5, p6);
straight_line(p1, p7);
mirror([1,0,0]) straight_line(p1, p7);
b_curve([p7, p8, p9, p10]);
mirror([1,0,0]) b_curve([p7, p8, p9, p10]);
b_curve([p10, p11, p12, p13]);
mirror([1,0,0]) b_curve([p10, p11, p12, p13]);
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

module straight_line(a, b)
    hull(){ 
       translate(a) shape();
       translate(b) shape();
    };

function b_pts(pts, n, idx) =
    len(pts)>2 ? 
        b_pts([for(i=[0:len(pts)-2])pts[i]], n, idx) * n*idx 
            + b_pts([for(i=[1:len(pts)-1])pts[i]], n, idx) * (1-n*idx)
        : pts[0] * n*idx 
            + pts[1] * (1-n*idx);
    
module b_curve(pts) 
    let (idx=fn(pts[0], pts[len(pts)-1]), n = 1/idx){       
        for (i= [0:idx-1]) 
        hull(){ 
           translate(b_pts(pts, n, i)) shape();
           translate(b_pts(pts, n, i+1)) shape();          
    };}