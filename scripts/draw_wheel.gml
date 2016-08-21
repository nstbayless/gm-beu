//draw_wheel(x,y,sprite,p1,p2,scale,color,alpha);
//p1 <= p2

var lx=argument0;
var ly=argument1;
var sprite=argument2;
var p1=argument3;
var p2=argument4;
var scale=argument5;
var color=argument6;
var alpha=argument7;

if (p2<=p1)
    exit;

var ring_w = sprite_get_width(sprite);
var ring_h = sprite_get_height(sprite);

if (p1==0&&p2==1) {
    draw_set_color(color);
    draw_set_alpha(alpha);
    draw_sprite_ext(sprite,0,lx-scale*ring_w/2,ly-scale*ring_h/2,scale,scale,0,color,alpha);
    exit;
}

if (p1<0.5) {
    //draw right side
    var b1=0.5-0.5*cos(p1*2*pi);
    var b2=0.5-0.5*cos(min(p2,0.5)*2*pi);
    draw_sprite_part_ext(sprite,0,0.5*ring_w,b1*ring_h,0.5*ring_w,(b2-b1)*ring_h,lx,ly+(b1-0.5)*ring_h*scale,scale,scale,color,alpha);
}

if (p2>0.5) {
    //draw left side
    var a1=0.5-0.5*cos(p2*2*pi);
    var a2=0.5-0.5*cos(max(0.5,p1)*2*pi);
    draw_sprite_part_ext(sprite,0,0,a1*ring_h,0.5*ring_w,(a2-a1)*ring_h,lx-ring_w*scale/2,ly+(a1-0.5)*scale*ring_h,scale,scale,color,alpha);
}
