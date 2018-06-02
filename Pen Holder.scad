
width=10;
height=10;
rim_thickness=0.4;
noodles=40;

$fn = 200;

module base(outer_radius, rim_size) {
    difference() {
        cylinder(r=outer_radius, h=rim_size);
        translate([0,0,rim_size/2]) cylinder(r=outer_radius-rim_size, h=rim_size/2);
    }
}

module lid(outer_radius, rim_size) {
    difference() {
        base(outer_radius, rim_size);
        cylinder(r=outer_radius-rim_size, h=rim_size);
    }
}




module twist(height, width, noodle_thickness, noodle_number) {
    step = 360 / noodle_number;
    
    linear_extrude(height=height, twist=120) {
        for(noodle = [0:step:360]) {
            rotate([0,0,noodle])
            translate([0, (width-noodle_thickness)/2, noodle_thickness]) circle(noodle_thickness/2);
        }
    }
}
/*
color("skyblue") base(width/2, rim_thickness);
color("purple")  translate([0,0,height]) lid(width/2, rim_thickness);
color("red") twist(height, width, rim_thickness, noodles);
*/

union() {
    base(width/2, rim_thickness);
    translate([0,0,height]) lid(width/2, rim_thickness);
    twist(height, width, rim_thickness, noodles);
}