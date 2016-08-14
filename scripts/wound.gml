//wound(obj,faction,definition)

//definition:
// 0 : dir
// 1 : damage
// 2 : knockback
// 3 : hit-stun time multiplier (zero -> default)
// 4 : instant kill
// 5 : respawn time (zero -> default)
// 6 : silent
// 7 : hitfreeze time (zero -> default
// 8 : freeze time


var obj = argument0;
var afaction = argument1;
var defn = argument2;
//init array if neceesary
defn[@ 9]=0;

//hitstun defaults
if (defn[3]==0)
    defn[3]=1;
if (defn[3]<0)
    defn[3]=0;
if (defn[7]==0) {
    defn[7]=min(25,floor(defn[@ 1]/12)*3);
}
if (defn[7]<0)  
    defn[7]=0;
__defn7_return=defn[7]

with (obj) {
    var damage=defn[@ 1]
    var knockback=defn[@ 2]
    if (defn[7]>0)
        play_sfx_at(x,y,z+dim_z/2,sfx_attack_begin)
    if (is_blocking&&(defn[@ 0]!=dir)) {
        damage = max(damage*stat_blk_mult-stat_blk_sub,0);
        knockback*=stat_blk_knock_mult;
        knockback-=stat_blk_knock_sub;
        if (loc_sfx_on_block>=0&&!defn[@ 6])
            play_sfx_delay_at(x,y,z+dim_z/2,loc_sfx_on_block,defn[@ 7]);
    } else {
        t_hit_stun=max(ceil(defn[@ 3]*stat_hit_stun_recovery_mult*(get_hit_stun_length(hit_stun_counter))),t_hit_stun)
        hit_stun_counter++;
        if (loc_sfx_on_hit>=0&&!defn[@ 6])
            play_sfx_delay_at(x,y,z+dim_z/2,loc_sfx_on_hit,defn[@ 7]);
    }
    if (knockback<0)
        knockback=0;
    knockback_vx=add_signed_quadrature(knockback_vx,knockback*defn[@ 0])
    hp-=damage;
    t_hit_freeze=max(t_hit_freeze,defn[@ 7]);
    if (t_hit_freeze==0)
        hit_stun_registered=true;
    if (hp<0)
        hp=0
    t_since_hit=0;
    if (defn[@ 4]) {
        if (defn[@ 5])
            kill(this,defn[@ 5]);
        else
            kill(this);
    }
}
