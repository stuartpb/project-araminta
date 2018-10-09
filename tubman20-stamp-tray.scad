jackson_width = 55.935;
jackson_height = 58.745;
module from_jackson_bottom_left(extents) {
  translate([-jackson_width/2,-jackson_height/2]) children();
}
tubman_height = 51.849;
tubman_y_offset = -(jackson_height-tubman_height)/2;

block_width = 101.6;
block_height = 76.2;
block_offset_x = (block_width - jackson_width)/2;
block_offset_y = -(block_height - jackson_height)/2;

lip_thickness = 1;
lip_height = 5;

// How deep to make the stamp.
stamp_depth = 1;

// How thick to make the layer behind the stamp.
backing_depth = 1;

silhouette_depth = 1;

// How much to overshoot with differences.
fudge = 1;

// Cutout for the beginning of the word "TWENTY"
twenty_safezone_x = 39;
twenty_safezone_h = 5;
// this doesn't really matter, just needs to overshoot the extents of the stamp
twenty_safezone_w = 50;

// Cutout for the banner underneath the portrait
copperplate_safezone_x = 17;
copperplate_safezone_w = 14.75;
copperplate_safezone_h = 3.5;
copperplate_x = 18.5;
copperplate_y = 0.5;

// Expansion to make the copperplate printable on a 0.4mm nozzle
copperplate_outset = -0.08;

// Extent values to counteract OpenSCAD's forced bounding-box centering

copperplate_w = 11.480;
copperplate_h = 1.482;

module stamp_design() {
  union() {
    difference() {
      translate([0, tubman_y_offset]) import("tubman-portrait.svg");
      translate([copperplate_safezone_x,-1,0]) from_jackson_bottom_left()
        square([copperplate_safezone_w,copperplate_safezone_h]);
      translate([twenty_safezone_x,0,0]) from_jackson_bottom_left()
        square([twenty_safezone_w,twenty_safezone_h]);
    }
    translate([copperplate_w/2+copperplate_x,copperplate_h/2+copperplate_y,0]) from_jackson_bottom_left()
      offset(delta=copperplate_outset) import("tubman-copperplate.svg");
  }
}

module stamp_negative () {
  union() {
    translate([0,0,backing_depth]) linear_extrude(silhouette_depth + fudge) import("jackson-silhouette.svg");
    translate([0, tubman_y_offset, backing_depth]) linear_extrude(silhouette_depth + fudge) import("tubman-silhouette.svg");
    translate([0,0, 0]) linear_extrude(stamp_depth + fudge) stamp_design();
  }
}

difference () {
  difference () {
    translate([-block_width/2-lip_thickness, -(block_height)/2-lip_thickness, 0]) cube([block_width + lip_thickness * 2, block_height + lip_thickness * 2, backing_depth + stamp_depth + silhouette_depth + lip_height]);
    translate([-block_width/2, -block_height/2, backing_depth + stamp_depth + silhouette_depth]) cube([block_width, block_height, lip_height + fudge]);
  }
  translate([block_offset_x, block_offset_y, backing_depth]) stamp_negative();
  rotate([0,0,180]) translate([block_offset_x, block_offset_y, backing_depth]) stamp_negative();
}
