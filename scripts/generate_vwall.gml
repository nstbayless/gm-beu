//generate_vwall(x,y,z,width,height)

var lx = argument0;
var ly = argument1;
var lz = argument2;
var w = argument3;
var h = argument4;

var vw = instance_create(lx,ly,vwall);
vw.z=lz;
vw.cn=0;
var tw = 64;
var th = 64;
for (var i=0;i<w/tw;i++) {
    for (var j=0;j<h/th;j++) {
        vw.child_x[vw.cn]=lx+i*tw;
        vw.child_z[vw.cn]=lz-j*th;
        vw.child_w[vw.cn]=tw;
        if (i*tw+vw.child_w[vw.cn]>w)
            vw.child_w[vw.cn]=w-i*tw //shrink last part of bg if no fit
        vw.child_h[vw.cn]=th;
        vw.child_bg[vw.cn]=bg_cliffs
        vw.child_left[vw.cn]=0;
        vw.child_top[vw.cn]=th*sign(j)
        vw.cn++;
    }
}
