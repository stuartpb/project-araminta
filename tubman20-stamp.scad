module tubman_portrait(h) {
  raster_scale = 55.935 / 448;
  translate([0, 0, h / 100]) scale([raster_scale, raster_scale, h / 100]) surface(file = "tubman-portrait.png", invert=true, convexity=300);
}

mirror([1,0,0]) translate([-23, -20, 0]) union() {
  linear_extrude(1) import("jackson-silhouette.dxf");
  linear_extrude(1) import("tubman-silhouette.dxf");
  translate([0,0,1]) union() {
    difference() {
      tubman_portrait(1);
      translate([17,-1,0]) cube([11.5,3,2]);
    }
    translate([18.5,0.5,0]) linear_extrude(1) import("tubman-copperplate.dxf");
  }
}
