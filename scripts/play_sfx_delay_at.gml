//play_sfx_delay_at(x,y,z,sfx,delay)

var lx = argument0
var ly = argument1;
var lz = argument2;
var lsfx = argument3;
var delay = argument4;

if (delay==0)
    play_sfx_at(lx,ly,lz,lsfx);
else {
    assert(instance_exists(room_properties));
    var i = room_properties.snd_daemon_queue_n++;
    room_properties.snd_daemon_x[i]=lx;
    room_properties.snd_daemon_y[i]=ly;
    room_properties.snd_daemon_z[i]=lz;
    room_properties.snd_daemon_sfx[i]=lsfx;
    room_properties.snd_daemon_delay[i]=delay;
}
