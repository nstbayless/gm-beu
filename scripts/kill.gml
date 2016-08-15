//kill(object,[respawn time])

var inst_actor = this;
if (argument_count>0)
    inst_actor=argument[0]
var re_time=95;
if argument_count>1
    re_time=argument[1];
with (inst_actor) {
    if (obj_explosion_loc>=0)
        (instance_create(x,y,obj_explosion_loc)).z=z;
    if (player>=0) {
        campaign.spawn_timer[campaign.spawn_n]=re_time;
        campaign.spawn_player[campaign.spawn_n]=player;
        campaign.spawn_n++;
        campaign.pc_alive_count--;
        instance_deactivate_object(this);
    } else instance_destroy();
    if (loc_sfx_on_death>=0)
        play_sfx_at(x,y,z+dim_z/2,loc_sfx_on_death)
}
