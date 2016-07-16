//wound(obj,faction,definition)

//definition:
// 0 : dir
// 1 : damage
// 2 : knockback
// 3 : freeze time

var obj = argument0;
var afaction = argument1;
var defn = argument2;
//init array if neceesary
defn[4]=0;

with (obj) {
    hp-=defn[1]
    t_since_hit=0;
}
