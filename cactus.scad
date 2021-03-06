// variables
fs = 1.2;  // roughly the size of straight parts of curves
w1 = 2.4;   // cookie cutter, thicker side
w2 = 0.8;   // cookie cutter, thinner side
h = 15;     // cookie cutter height

// points 
p1 = [51, 81.5];
p1a = [58, 81.5];
p1b = [58.5, 63];
p2 = [58.5, 58];
p2a = [58.5, 45];
p3 = [46, 40];
p2b = with_slope(p3, 8, 0.08);
p3a = with_slope(p3, -3, 0.08); 
p3b = [40.5, 35];
p4 = [40.5, 31];
p4a = [40.5, 5];
p4b = [40.5, 0];
p4c = [39, 0];
p5 = [28, 0];
p5a = [20, 0];
p5b = [18.5, 2.8];
p6 = [18.5, 3.2];
p6a = [18.5, 4];
p6b = [20.5, 10];
p7 = [20.5, 24];
p7a = [20.5, 30];
p8 = [10, 32.5];
p7b = with_slope(p8, 2, -0.1); 
p8a = with_slope(p8, -6.5, -0.1); 
p8b = [0, 35];
p9 = [0, 52];
p9a = [0, 65];
p9b = [2.5, 75.5];
p10 = [9.5, 75.5];
p10a = [19.5, 75.5];
p10b = [11, 46];
p11 = [17.2, 46];
p11a = [23, 46];
p11b = [14, 90];
p12 = [30, 90];
p12a = [37, 90];
p12b = [46, 77];
p12c = [35, 54.5];
p13 = [41, 54.5];
p13a = [48, 54.5];
p13b = [43, 70];
p13c = [43, 81.5];

// model
b_curve([p1, p1a, p1b, p2]);
b_curve([p2, p2a, p2b, p3]);
b_curve([p3, p3a, p3b, p4]);
b_curve([p4, p4a, p4b, p4c, p5]);
b_curve([p5, p5a, p5b, p6]);
b_curve([p6, p6a, p6b, p7]);
b_curve([p7, p7a, p7b, p8]);
b_curve([p8, p8a, p8b, p9]);
b_curve([p9, p9a, p9b, p10]);
b_curve([p10, p10a, p10b, p11]);
b_curve([p11, p11a, p11b, p12]);
b_curve([p12, p12a, p12b, p12c, p13]);
b_curve([p13, p13a, p13b, p13c, p1]);

// functions and modules
function fn(a, b) = round(sqrt(pow(a[0]-b[0],2) + pow(a[1]-b[1], 2))/fs);

function with_slope(p, x_diff, s) // point, difference in x, slope
    = [p[0] + x_diff, p[1] + x_diff * s];    

module shape() cylinder(h, w1/2, w2/2, $fn=12);
    
module b_curve(pts)             // pts is an array of points
    let (idx=fn(pts[0], pts[len(pts)-1]), n = 1/idx){       
        for (i= [0:idx-1]) 
        hull(){ 
           translate(b_pts(pts, n, i)) shape();
           translate(b_pts(pts, n, i+1)) shape();          
        }
    }
    
function b_pts(pts, n, idx) =       // gets called by b_curve() ...
    len(pts)>2 ?                    // ... and b_curve_rainbow() 
        b_pts([for(i=[0:len(pts)-2])pts[i]], n, idx) * n*idx 
            + b_pts([for(i=[1:len(pts)-1])pts[i]], n, idx) * (1-n*idx)
        : pts[0] * n*idx 
            + pts[1] * (1-n*idx);