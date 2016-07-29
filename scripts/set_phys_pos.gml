//set_phys_pos: x,y,z
//takes on-sreen u,v,w coords to give physical x,y,z coord
//using the camera angle in z_cue.

//todo: make use of _skew

var _aot=1;
with (z_cue) {_aot=aot;}

var _u=x;
var _v=y;
var _w=z;

if (_aot==0) {
    x=_u;
    y=_w;
    z=-_v;
} else {
    x=_u;
    y=(_v+_w)/_aot;
    z=_w;
}
