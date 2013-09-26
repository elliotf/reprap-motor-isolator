motor_side = 42;
motor_hole_spacing = 31;
motor_shoulder_diam = 24;

isolator_thickness = 1;
screw_diam = 3.2;

left = -1;
right = 1;
front = -1;
rear = 1;

module isolator() {
  difference() {
    cube([motor_side,motor_side,isolator_thickness],center=true);
    cylinder(r=motor_shoulder_diam/2,h=isolator_thickness+1,center=true);
    for(side=[left,right]) {
      for(end=[front,rear]) {
        translate([motor_hole_spacing/2*side,motor_hole_spacing/2*end,0])
          cylinder(r=screw_diam/2,h=isolator_thickness+1,center=true);
      }
    }

    translate([motor_side/2,0,0]) cube([motor_side,.5,isolator_thickness+1],center=true);
  }
}

projection() isolator();
