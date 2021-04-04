// variables
fs = 1;  // roughly the size of straight parts of curves
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
circle_ish(15, 143, 4); // given fn
circle_ish(10, 93);     // calculated fn
b_curve([p1, p2, p3, p4]);
b_curve_rainbow([p5, p6, p7, p8]); // circle shape
b_curve_rainbow([p2, p6, p7, p8, p4]);
rainbow([p2, p6, p7, p8, p4]);

// functions and modules
function add(v) = [for(p=v) 1]*v;   // from https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Add_all_values_in_a_list
function fn(a, b) = round(sqrt(pow(a[0]-b[0],2) + pow(a[1]-b[1], 2))/fs);
function fn_all(pts) = add([for(i=[0:len(pts)-2]) fn(pts[i], pts[i+1]), 
    fn(pts[0], pts[len(pts)-1])])/3;

function fn_circle(r, angle) = round((PI *r*angle)/(180*fs));

function with_slope_diff(p, x_diff, s) // point, difference in x, slope
    = [p[0] + x_diff, p[1] + x_diff * s];  
    
function with_slope_angle(p, dist, angle) // point, distance, angle
    = p + [cos(angle)*dist, sin(angle)*dist, 0];
    
module shape() cylinder(h, w1/2, w2/2, $fn=12);

module straight_line(a, b)  // a and b are points/vectors
    hull(){ 
       translate(a) shape();
       translate(b) shape();
    }
    
module circle_ish(r, angle, fn)     // r = radius, fn is optional
    if (fn==undef)
        let(fn=fn_circle(r, angle))
            circle_ish_inner(r, angle, fn);
    else
        circle_ish_inner(r, angle, fn);
    
module circle_ish_inner(r, angle, fn)   // gets called by circle_ish()
    let (interval = angle/fn)
    for (i= [0:interval:(angle-interval)]) 
        hull(){
            translate([cos(i)*r, sin(i)*r, 0]) shape(); 
            translate([cos(i+interval)*r, sin(i+interval)*r, 0]) shape(); 
        }
    
module b_curve(pts)             // pts is an array of points
    let (idx=fn_all(pts), n = 1/idx){ 
  echo(idx=idx);      
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
            
module b_curve_rainbow(pts)     // use it to find points for Bézier curve
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