//get_random_alive_player

var pc_n = irandom(campaign.pc_alive_count-1)
for (var i=0;i<campaign.pc_count;i++) {
    var pc_inst = campaign.pc_actor[i]
    if (instance_exists(pc_inst))
        if (pc_n--==0)
            return pc_inst;
}
