// variables
diameter = 70;
spike_number = 7;
spike_size = 11;

h = 15;     // cookie cutter height
fs = 0.8;     // roughly the size of straight parts of curves
w1 = 2.4;   // cookie cutter, thicker side
w2 = 0.8;   // cookie cutter, thinner side

// points for spike Bézier curves
p1 = [diameter/2, 0];
p2 = [diameter/2, spike_size*0.45];
p3 = [diameter/2 - spike_size*0.1, spike_size*0.5];
p4 = [diameter/2 - spike_size*0.2, spike_size*0.5];
p5 = [diameter/2 - spike_size*0.5, spike_size*0.5];
p6 = [diameter/2 - spike_size*0.3, spike_size*0.25];
// in case the spike and the curve does not align well, play with
// the weird number in the following line:
p7 = [diameter*0.4978 - spike_size, spike_size*0.25];

// untility functions and modules
function fn(a, b) = round(sqrt(pow(a[0]-b[0],2) + pow(a[1]-b[1], 2))/fs);
function fn_circle(r, angle) = round((PI *r*angle)/(180*fs));

module shape() cylinder(h, w1/2, w2/2, $fn=12);

module circle_ish(r, angle)     // r = radius
    let(fn=fn_circle(r, angle), interval = angle/fn)
        for (i= [0:interval:(angle-interval)]) 
        hull(){
            translate([cos(i)*r, sin(i)*r, 0]) shape(); 
            translate([cos(i+interval)*r, sin(i+interval)*r, 0]) shape(); 
        }

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
            
// specific modules
module half_spike() {
b_curve([p1, p2, p3, p4]);
b_curve([p7, p6, p5, p4]);}

module spike() {
    half_spike();
    mirror([0, 1, 0])half_spike();
    difference(){
        rotate([0, 0, -180/spike_number])
            circle_ish(diameter/2 - spike_size, 360/spike_number);
        cube([3*diameter, spike_size*0.5, 3*h], true);
    };
}

// cookie cutter
for (i=[1:spike_number])
    rotate([0, 0, i*360/spike_number]) spike();