//draw_box(x,y,z,w,h,zh,outline)

var xind = 1;
var yind = 2;
var zind = 4;

var x1=argument0;
var y1=argument1;
var z1=argument2+argument5;
var w=argument3;
var h=argument4;
var zh=-argument5;
var vstyle = pr_linestrip
if (!argument6)
    vstyle=pr_trianglefan

for (var ix=0;ix<=1;ix++)
    for (var iy=0;iy<=1;iy++)
        for (var iz=0;iz<=1;iz++) {
            u[xind*ix+yind*iy+zind*iz]=get_draw_x(x1+ix*w,y1+iy*h)
            v[xind*ix+yind*iy+zind*iz]=get_draw_y(y1+iy*h,z1+iz*zh)
        }

draw_primitive_begin(vstyle)
if (camera.skew<=0) {
    draw_vertex(u[xind+yind],v[xind+yind])
    draw_vertex(u[yind],v[yind])
    draw_vertex(u[yind+zind],v[yind+zind])
    draw_vertex(u[xind+yind+zind],v[xind+yind+zind])
    draw_vertex(u[xind+zind],v[xind+zind])
    draw_vertex(u[xind],v[xind])
    draw_vertex(u[0],v[0])
    draw_vertex(u[yind],v[yind])
} else {
    draw_vertex(u[yind],v[yind])
    draw_vertex(u[xind+yind],v[xind+yind])
    draw_vertex(u[xind+yind+zind],v[xind+yind+zind])
    draw_vertex(u[yind+zind],v[yind+zind])
    draw_vertex(u[zind],v[zind])
    draw_vertex(u[0],v[0])
    draw_vertex(u[xind],v[xind])
    draw_vertex(u[xind+yind],v[xind+yind])
}
draw_primitive_end();
