mirror([1,0,0]) translate([-23, -20, 0]) union() {
  linear_extrude(1) import("jackson-silhouette.dxf");
  linear_extrude(1) import("tubman-silhouette.dxf");

  translate([0,0,1]) union() {
    difference() {
      linear_extrude(1) import("tubman-portrait.dxf");
      translate([17,-1,0]) cube([11.5,3,2]);
    }
    translate([18.5,0.5,0]) linear_extrude(1) import("tubman-copperplate.dxf");
  }
}
