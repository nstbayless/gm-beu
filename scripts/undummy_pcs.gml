//dummy_pc()
for (var i=0;i<campaign.pc_count;i++)
    with campaign.pc_actor[i]
        p_mode=P_AUTOMATIC;
room_properties.sem_critical--;
