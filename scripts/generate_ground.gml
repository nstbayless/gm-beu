//generate_ground(x,y,z,w,h)
var gr = instance_create(argument0,argument1,ground);
gr.z=argument2;
gr.zbot=argument2-1000;
gr.width=argument3;
gr.height=argument4;
//gr.no_cliffs=true;
var tw=32;
var th=32;

gr.surf_w=gr.width;
gr.surf_h=gr.height;
gr.minx=gr.x;
gr.miny=gr.y
gr.maxx=gr.x+gr.width;
gr.maxy=gr.y+gr.height;
gr.use_surf=true
gr.cn=0;

use_dirt = (random(1)>.62)

for (var i=0;i<gr.width/tw;i++)
    for (var j=0;j<gr.height/th;j++) {
        gr.child_y[gr.cn]=gr.y+j*th;
        gr.child_x[gr.cn]=gr.x+i*tw;
        gr.child_h[gr.cn]=th;
        gr.child_w[gr.cn]=tw;
        gr.child_bg[gr.cn]=bg_grass;
        if (!use_dirt) {
        var top=irandom(9)*th;
            gr.child_left[gr.cn]=6*tw;
            gr.child_top[gr.cn]=top
        } else {
            gr.child_top[gr.cn] = tw*(irandom(3)+1);
            gr.child_left[gr.cn] = th*(irandom(1)+3)
        }
        gr.cn++;
    }
with (gr) {event_user(1)};
with (gr) {event_user(2)};
register_ground(gr);
