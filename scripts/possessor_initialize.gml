//possessor_initialize([port_n])
//port_n: number of ports to possess with
//called by possessor to initialize variables for possession

var port_n=1;
if (argument_count>0)
    port_n = argument[0];

for (var i=0;i<port_n;i++) {
    port_move_x[i]=0;
    port_move_y[i]=0;
    port_do_dir[i]=0;
    port_do_block[i]=false;
    port_do_jump[i]=false;
    port_do_run[i]=false;
    port_do_zhalt[i]=false;
    port_do_atk[i]=false;
    port_extra_action[i]=0;
}
