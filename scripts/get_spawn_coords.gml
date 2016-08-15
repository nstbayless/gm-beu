//get_spawn_coords()

if (campaign.pc_alive_count>0) {
    //find average position
    var xsum=0;
    var ysum=0;
    var zsum = 0;
    var nsum=0;
    for (var i=0;i<campaign.pc_count;i++) {
        var lpc = pc_actor[i];
        if (instance_exists(lpc)) {
            xsum+=lpc.x;
            ysum+=lpc.y;
            zsum+=lpc.z;
            nsum++;
        }
    }
    assert(nsum>0)
    var lx = xsum/nsum;
    var ly = ysum/nsum;
    var lz = zsum/nsum;
    var pc_maxwidth = 30;
    var pc_maxheight = 20;
    var z_rest_a=find_z_rest(lx-pc_maxwidth/2,ly-pc_maxheight/2,lx+pc_maxwidth/2,ly+pc_maxheight/2,1000000)
    var z_rest = z_rest_a[1];
    if (z_rest==room_properties.bottom || abs(z_rest-lz)>300) {
        //failure, this would spawn in a pit or somewhere bad.
        //if fails, set to an arbitrary player's current coords
        var pc_alive = get_random_alive_player();
        return get_coords(pc_alive);
    }
    return make_array(lx,ly,z_rest);
}

if instance_exists(ch_spawn)
    return make_array(ch_spawn.x,ch_spawn.y,ch_spawn.z);

assert(false);
