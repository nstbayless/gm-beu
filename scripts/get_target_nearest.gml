//get_target_nearest(x,y)
//get nearest target to x,y coords
var lx=x;
var ly=y;

if (argument_count>1) {
    lx = argument[0]
    ly = argument[1]
}

var afaction = faction;
var local_target=noone;
var local_mdist=-1;
with (obj_actor) {
    if (faction!=afaction) {
        dist=distance_to_point(lx,ly)
        if (local_target==noone) {
           local_mdist=dist;
           local_target=id
        }
        else if (dist<local_mdist) {
            local_mdist=dist;
            local_target=id;
        }
    }
}
return local_target;
