//possess_control() : possessor_port, possessor_instance -> *
//called by possessed instance to allow possessor to control it


if (p_mode!=P_POSSESSOR && p_mode!=P_DUMMY)
    exit;

var pos = possessor_instance;
var port = possessor_port;

if (p_mode==P_DUMMY) {
    if (p_mode==P_DUMMY) {
        possessor_instance=campaign.possessor_dummy
        possessor_port=0
    }
}

move_x=pos.port_move_x[port];
move_y=pos.port_move_y[port];
do_block=pos.port_do_block[port];
do_run=pos.port_do_run[port];
do_zhalt=pos.port_do_zhalt[port];
do_atk=pos.port_do_atk[port];
extra_action=pos.port_extra_action[port];
