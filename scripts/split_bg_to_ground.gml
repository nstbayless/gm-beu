//split_bg_to_ground(bg_target,ground_width,prec_y)

//used to split backgrounds into ground tiles for side-view segments

bg_target=argument0;
GROUND_WIDTH=argument1;
PREC_Y=argument2;

bg_w=background_get_width(bg_target);
bg_h=background_get_height(bg_target)
var surf = surface_create(bg_w,bg_h);
surface_set_target(surf);
draw_clear(c_white);
draw_background(bg_target,0,0);
surface_reset_target();
for (var i=0;i<bg_w/GROUND_WIDTH;i++){
    
    //binary search:
    var py_win_min=0;
    var py_win_max=bg_h;
    var avg=bg_h/2;
    var px=floor((i+0.5)*GROUND_WIDTH);
    while (abs(py_win_min-py_win_max)>PREC_Y) {
        var pixel_lum = 1-colour_get_red(surface_getpixel(surf,px,avg));
        if (pixel_lum>0.2) {
            py_win_max=avg;
        } else {
        py_win_min=avg;
        }
        avg = floor((py_win_min+py_win_max)/2);
    }
    inst_ground = instance_create(i*GROUND_WIDTH,-100,ground);
    inst_ground.z=-avg+floor(PREC_Y/2)+z_offset;
    inst_ground.nomap=true;
    inst_ground.width=GROUND_WIDTH;
    inst_ground.height=bg_h*2;
    inst_ground.slope_px=2+GROUND_WIDTH*1.5;
    register_ground(inst_ground);
    if (i==floor(ch_spawn.x/GROUND_WIDTH))
        ch_spawn.z=inst_ground.z;
}
assert(surface_exists(surf));
surface_free(surf);
