// variables / proportions
w1 = 2.5;   // wall thickness where you touch the cookie cutter
w2 = 0.8;   // wall thickness where it cuts the dough
h = 15;     // height
bk = 55; // width knob head
bf = 48; // width foot
hf = 20; // height foot
rs = 2.5;  // small radii
rl = 9; // large radii
dt = 2;  // dough thickness at the carve, '0' for cut
shape_points = [[w1/2, 0], [-w1/2, 0], [-w2/2, h], [w2/2, h]];
half_shape_points = [[w1/2, 0], [0, 0], [0, h], [w2/2, h]];

// small radii
translate([-bf/2 +rs, -hf+rs]) rotate ([0,0, 180]) 
    rotate_extrude(angle = 90, $fn = 40) translate ([rs, 0]) 
        polygon(points=shape_points); 
translate([-bk/2 +rs, rl +rs]) rotate ([0,0, 180]) 
    rotate_extrude(angle = 90, $fn = 40) translate ([rs, 0]) 
        polygon(points=shape_points);
translate([bf/2-rs, -hf+rs]) rotate ([0,0, 270]) 
    rotate_extrude(angle = 90, $fn = 40) translate ([rs, 0]) 
        polygon(points=shape_points);
translate([bk/2-rs, rl+rs]) rotate ([0,0, 270]) 
    rotate_extrude(angle = 90, $fn = 40) translate ([rs, 0]) 
        polygon(points=shape_points);

// large radii
translate([bf/2, rl, 0])rotate ([0,0, 180])
    rotate_extrude(angle = 90, $fn = 40) translate ([rl, 0]) 
        polygon( points=shape_points );
translate([-bf/2, rl, 0])rotate ([0,0, 270])
    rotate_extrude(angle = 90, $fn = 40) translate ([rl, 0]) 
        polygon( points=shape_points );

// cupola
translate([0, rl + rs, 0])rotate_extrude(angle = 180, $fn = 60) 
    translate ([bk/2, 0]) polygon( points=shape_points );

// corner stones next to large radii
translate([bf/2, 0, 0])rotate_extrude($fn = 20) 
    polygon(points=half_shape_points); 
translate([-bf/2, 0, 0])rotate_extrude($fn = 20) 
    polygon(points=half_shape_points); 
translate([bf/2-rl, rl, 0])rotate_extrude($fn = 20) 
    polygon(points=half_shape_points); 
translate([-bf/2+rl, rl, 0])rotate_extrude($fn = 20) 
    polygon(points=half_shape_points); 

// straight sides
translate([bf/2, -hf+rs, 0])xz_extrude(shape_points, hf-rs, false);
translate([-bf/2, -hf+rs, 0])xz_extrude(shape_points, hf-rs, false);
translate([0, -hf,0])yz_extrude(shape_points, bf-2*rs, true);
difference(){
    translate([0, rl, 0])yz_extrude(shape_points, bk-2*rs, true);
    translate([0, 0, 1.5*h-dt])cube([bf-2*rl, 3*rl, h], true);
};

// modules
module xy_extrude(points, height, center = true) {
    linear_extrude(height = height, center = center) 
        polygon(points = points); 
};

module xz_extrude(points , height , center = true){
    rotate([90, 0, 0])
        mirror([0, 0, 1])        
            xy_extrude(points, height, center);            
};

module yz_extrude(points , height , center = true){
    rotate([90, 0, 90])
        xy_extrude(points, height, center);
};
