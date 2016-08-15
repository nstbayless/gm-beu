//wound(obj,faction,definition)

//definition:
// 0 : dir
// 1 : damage
// 2 : knockback (zero -> default)
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

var default_knockback=false;
var default_hitfreeze=false;

//spec defaults
if (defn[2]==0) {
    default_knockback=true;
}
if (defn[2]<0)  
    defn[2]=0;
if (defn[3]==0)
    defn[3]=1;
if (defn[3]<0)
    defn[3]=0;
if (defn[7]==0) {
    default_hitfreeze=true;
}
if (defn[7]<0)  
    defn[7]=0;

with (obj) {
    var damage=defn[@ 1]
    var knockback=defn[@ 2]
    var loc_sfx = noone
    var blocked=false;
    if (is_blocking&&(defn[@ 0]!=dir))
        blocked=true;
    if (blocked) {
        loc_sfx = loc_sfx_on_block;
        damage*=stat_blk_mult;
        damage-=stat_blk_sub;
        damage=max(0,damage);
    } else {
        t_hit_stun=max(ceil(defn[@ 3]*stat_hit_stun_recovery_mult*(get_hit_stun_length(hit_stun_counter))),t_hit_stun)
        hit_stun_counter++;
        loc_sfx=loc_sfx_on_hit;
    }
    
    //determine knockback from damage:
    if (default_knockback) {
        if (damage<10)
            knockback=0;
        else
            knockback=damage/1.5+2;
        if (blocked)
            knockback/=1.5;
    }
    
    //determine hitfreeze from damage:
    if (default_hitfreeze) {
        defn[7]=min(25,floor(damage/10)*2);
        if (defn[7])>0
            defn[7]+=3
        if (defn[7])>8
            defn[7]=floor(8+(defn[7]-8/1.5))
    }
    __defn7_return=defn[7];
    
    //if silent, play no sound
    if (defn[@ 6])
        loc_sfx_hit=noone;
    
    //play hit-start sound if delay:
    if (defn[7]>0&&!defn[@ 6])
        play_sfx_at(x,y,z+dim_z/2,sfx_attack_begin)
    
    //play sound effect indicating hit:
    play_sfx_delay_at(x,y,z+dim_z/2,loc_sfx,defn[@ 7]);
    
    hp-=damage;
    
        
    var _dir = defn[@ 0]
    if (_dir==0)
        _dir=-direction;
    
    //angle of deflection for knockback:
    var sak_angle=0;
    
    //knockback:
    knockback_vx=add_signed_quadrature(sqrt(knockback_vx*knockback_vx+vspd*vspd),knockback*_dir)
    if (abs(knockback_vx)>30||(!on_ground&&abs(knockback_vx)>24))
        sak_angle=min(pi/3.5,abs(knockback_vx)/36-0.6)
    if (sak_angle>0.03) {
        vspd=sin(sak_angle)*knockback_vx;
        is_jumping=false;
    }
    knockback_vx=cos(sak_angle)*knockback_vx;
    
    //hit freeze:
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
