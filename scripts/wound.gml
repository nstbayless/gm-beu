//wound(obj,faction,definition)

//definition:
// 0 : dir
// 1 : damage
// 2 : knockback
// 3 : hit-stun time (zero is default)
// 4 : instant kill
// 5 : respawn time (zero is default)
// 6 : silent
// 7 : freeze time

var obj = argument0;
var afaction = argument1;
var defn = argument2;
//init array if neceesary
defn[8]=0;

//hitstun defaults
if (defn[3]==0)
    defn[3]=7;
if (defn[3]<0)
    defn[3]=0;

with (obj) {
    var damage=defn[1]
    var knockback=defn[2]
    if (is_blocking&&(defn[0]!=dir)) {
        damage = max(damage*stat_blk_mult-stat_blk_sub,0);
        knockback*=stat_blk_knock_mult;
        knockback-=stat_blk_knock_sub;
        if (loc_sfx_on_block>=0&&!defn[6])
            play_sfx_at(x,y,z+dim_z/2,loc_sfx_on_block);
    } else {
        t_hit_stun=defn[3]
        if (loc_sfx_on_hit>=0&&!defn[6])
            play_sfx_at(x,y,z+dim_z/2,loc_sfx_on_hit);
    }
    if (knockback<0)
        knockback=0;
    knockback_vx=add_signed_quadrature(knockback_vx,knockback*defn[0])
    hp-=damage;
    t_since_hit=0;
    if (defn[4]) {
        if (defn[5])
            kill(this,defn[5]);
        else
            kill(this);
    }
}
    
