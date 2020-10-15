// variables
// roughly the size of straight parts of curves
fs = 0.5;

// points
// outside
p1 = [12, 20];
p2 = [12, 5];
p3 = [12, 1];
p4 = [13, 0];
p5 = [11, 0];
p6 = [10.5, 1];
p7 = [10.5, 2];
p8 = [10, 1];
p9 = [8, 0];
p10 = [5.5, 0];
p11 = [1.5, 0];
p12 = [0, 2];
p13 = [0, 7];
p14 = [0, 11];
p15 = [1, 15];
p16 = [5, 15];
p17 = [8, 15];
p18 = [10, 14];
p19 = [10, 12];
p20 = [10, 14];
p21 = [10.1, 20];

for (i=[p1, p4, p5, p7, p10, p13, p16, p19, p21]) 
    translate(i) color("red")cylinder(2, 0.3, 0.3, $fn=10);

// displaying all defining points
for (i=[p2, p3, p6, p8, p9, p11, p12, p14, p15, p17, p18, p20]) 
        translate(i) color("black")cylinder(1, 0.3, 0.3, $fn=10);

// functions and modules
function fn(a, b) = round(sqrt(pow(a[0]-b[0],2) + pow(a[1]-b[1], 2))/fs);
        
function b_pts(pts, n, idx) =
    len(pts)>2 ? 
        b_pts([for(i=[0:len(pts)-2])pts[i]], n, idx) * n*idx 
            + b_pts([for(i=[1:len(pts)-1])pts[i]], n, idx) * (1-n*idx)
        : pts[0] * n*idx 
            + pts[1] * (1-n*idx);

function b_curv(pts) =
    let (fn=fn(pts[0], pts[len(pts)-1]))
    [for (i= [0:fn]) concat(b_pts(pts, 1/fn, i))];
    

outside_points = concat(    
    b_curv([p21, p1]),
    b_curv([p19, p20, p21]),
    b_curv([p16, p17, p18, p19]),
    b_curv([p13, p14, p15, p16]),
    b_curv([p10, p11, p12, p13]),
    b_curv([p7, p8, p9, p10]),
    b_curv([p5, p6, p7]),
    b_curv([p4, p5]),
    b_curv([p1, p2, p3, p4]));
    
    polygon(points = outside_points);













   
/*
module b_curve_rainbow(pts) 
    let (idx=fn(pts[0], pts[len(pts)-1]), n = 1/idx)
    for (i= [0:idx]) 
    color([
        cos(20*i)/2 + 0.5, 
        -sin(20*i)/2 + 0.5, 
        -cos(20*i)/2 + 0.5, 
        1])
    translate(b_pts(pts, n, i)) sphere(0.65, $fn=15);

//rainbow
// outside
b_curve_rainbow([p1, p2, p3, p4]);
b_curve_rainbow([p4, p5]);
b_curve_rainbow([p5, p6, p7]);
b_curve_rainbow([p7, p8, p9, p10]);
b_curve_rainbow([p10, p11, p12, p13]);
b_curve_rainbow([p13, p14, p15, p16]);
b_curve_rainbow([p16, p17, p18, p19]);
b_curve_rainbow([p19, p20, p21]);
b_curve_rainbow([p21, p1]);
// inside
b_curve_rainbow([p22, p23, p24, p25]);
b_curve_rainbow([p25, p26, p27, p28]);
b_curve_rainbow([p28, p29, p30, p31]);
b_curve_rainbow([p31, p32, p33, p22]);*/