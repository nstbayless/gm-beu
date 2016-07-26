//kill(object,[respawn time])

var inst_actor = argument[0]
var re_time=95;
if argument_count>1
    re_time=argument[1];
with (inst_actor) {
    if (player>=0) {
        campaign.spawn_timer[campaign.spawn_n]=re_time;
        campaign.spawn_inst[campaign.spawn_n]=this;
        campaign.spawn_n++;
    } else instance_destroy();
    instance_deactivate_object(this);
}
