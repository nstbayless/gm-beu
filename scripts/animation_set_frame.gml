//animation_set_frame(): AN_* -> anim,AN

var anim_lock = false;
if (is_hit_frozen())
    anim_lock=true;

if (!anim_lock)
    anim=floor(anim+1);

AN=AN_idle;

if (do_fly) {
    if (!anim_lock)
        anim_move+=1;
    AN=AN_fly;
}else if (phys_moved_dist>0) {
    if (!anim_lock)
        anim_move+=phys_moved_dist;
    anim=anim_move;
    AN = AN_walk;
    if (do_run)
        AN = AN_run;
} else anim_move=0;

if (is_blocking)
    AN = AN_block;

if (t_since_attack>=0&&t_since_attack<5)
    AN = AN_attack;

if (hit_stun_registered)
    AN = AN_hitstun;
