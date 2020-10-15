// variables
// roughly the size of straight parts of curves
fs = 0.5;

//points
p1 = [10, 7.5, 0];
p2 = [10, 4, 0];
p3 = [9.5, 1.7, 0];
p4 = [6, 1.7, 0];
p5 = [3, 1.7, 0];
p6 = [2.6, 4, 0];
p7 = [2.6, 7.5, 0];
p8 = [2.6, 10, 0];
p9 = [3, 13, 0];
p10 = [6, 13, 0];
p11 = [9, 13, 0];
p12 = [10, 11.5, 0];

// displaying all defining points
for (i=[p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]) 
    translate(i) color("grey")sphere(0.3, $fn=20);
    
//rainbow
all_rainbow = concat(
    b_curv([p1, p2, p3, p4]),
    b_curv([p4, p5, p6, p7]),
    b_curv([p7, p8, p9, p10]),
    b_curv([p10, p11, p12, p1]));
    
 rainbow(all_rainbow);  

// functions and modules
function fn(a, b) = round(sqrt(pow(a[0]-b[0],2) + pow(a[1]-b[1], 2))/fs);

function b_pts(pts, n, idx) =
    len(pts)>2 ? 
        b_pts([for(i=[0:len(pts)-2])pts[i]], n, idx) * n*idx 
            + b_pts([for(i=[1:len(pts)-1])pts[i]], n, idx) * (1-n*idx)
        : pts[0] * n*idx 
            + pts[1] * (1-n*idx);

function b_curv(pts) =
    let (idx=fn(pts[0], pts[len(pts)-1]), n = 1/idx)
    [for (i= [0:idx]) concat(b_pts(pts, n, i))];
        
module rainbow 
    (points,		    // A vector of points, the only must-have
	many_colors = 20,   // Determins width of gradient
	size_sphere = 0.3)    // Depends on the size of your model
{
for (i= [0 : len(points)-1 ])
    color([cos(many_colors*i)/2+0.5, 
        -sin(many_colors*i)/2+0.5, 
        -cos(many_colors*i)/2+0.5, 
        1])
    translate(points[i]) sphere(size_sphere, $fn=20);
} 