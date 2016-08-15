//post_attack(object hit)
//call this after an attack

var obj_hit=argument0;

if (obj_hit!=noone) {
    if (!on_ground) {
        //aerial attack; bounce
        vspd=8;
        t_hit_freeze+=3;
        knockback_vx-=5*dir;
        is_jumping=false;
    }
}
