// variables
fs = 0.5;  // roughly the size of straight parts of curves
w1 = 2.4;   // cookie cutter, thicker side
w2 = 0.8;   // cookie cutter, thinner side
h = 15;     // cookie cutter height

// points for examples
p1 = [5, -5];
p2 = [5, 30];
p3 = [-3, -55];
p4 = [-5, 5];
p5 = [10, 0];
p6 = [10, 10*4/3];
p7 = [-10, 10*4/3];
p8 = [-10, 0];

// examples
b_curve([p1, p2, p3, p4]);
//b_curve_rainbow([p1, p3, p2, p4]);
b_curve_rainbow([p5, p6, p7, p8]); // circel shape
b_curve_rainbow([p2, p6, p7, p8, p4]);
rainbow([p2, p6, p7, p8, p4]);
circle_ish(10, 93, 22);

// functions and modules
function fn(a, b) = round(sqrt(pow(a[0]-b[0],2) + pow(a[1]-b[1], 2))/fs);

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
    
module b_curve_rainbow(pts) 
    let (idx=fn(pts[0], pts[len(pts)-1]), n = 1/idx)
    for (i= [0:idx]) 
    color([
        cos(20*i)/2 + 0.5, 
        -sin(20*i)/2 + 0.5, 
        -cos(20*i)/2 + 0.5, 
        1])
    translate(b_pts(pts, n, i)) sphere(0.65);

module rainbow 
    (points,		    // a vector of points
	many_colors = 20)   // determins width of gradient    
{
for (i= [0 : len(points)-1 ])
    color([
        cos(many_colors*i)/2+0.5, 
        -sin(many_colors*i)/2+0.5, 
        -cos(many_colors*i)/2+0.5, 
        1])
    translate(points[i]) sphere(0.65);
}