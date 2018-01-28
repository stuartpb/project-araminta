raster_ipd = 63;
bill_ipd = 9.6;
raster_scale = bill_ipd/raster_ipd;
translate([0,0,.25]) cube([260*raster_scale,300*raster_scale,.5],center=true);
translate([0,0,.5]) scale([raster_scale,raster_scale,.01]) surface(file = "tubman-heightmap.png", center=true, convexity=30);
