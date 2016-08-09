//dialogue_wait_for(obj_line)
//returns true when the given line has been completed

if (argument0==noone)
    return false;
if (argument0._completed &&! argument0._waited_for) {
    argument0._waited_for=true;
    return true;
}
return false;
