//get_hit_stun_length(hit_stun_counter)
switch (argument0*stat_hit_stun_recovers) {
case 0: return 5;
case 1: return 3;
case 2: return 2;
case 3: return 1.5;
default:
    return 1/(argument0-3)
}
