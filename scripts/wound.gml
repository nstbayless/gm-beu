//wound(obj,faction,definition)

//definition:
// 0 : dir
// 1 : damage
// 2 : knockback
// 3 : freeze time
// 4 : instant kill
// 5 : respawn time (zero is default)

var obj = argument0;
var afaction = argument1;
var defn = argument2;
//init array if neceesary
defn[6]=0;

with (obj) {
    var damage=defn[1]
    if (is_blocking)
        damage = max(damage*stat_blk_mult-stat_blk_sub,0);
    hp-=damage;
    t_since_hit=0;
    if (defn[4]) {
        if (defn[5])
            kill(this,defn[5]);
        else
            kill(this);
    }
}
