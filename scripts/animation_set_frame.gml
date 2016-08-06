//animation_set_frame(): AN_* -> anim,AN

anim=floor(anim+1);

AN=AN_idle;

if (phys_moved_dist>0) {
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

if (is_hit_stunned())
    AN = AN_hitstun;
