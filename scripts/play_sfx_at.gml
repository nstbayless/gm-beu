//sfx_play_at(x,y,z,index)

var lx=argument0;
var ly=argument1;
var lz=argument2;

if (config.SFX_ENABLED)
    audio_play_sound_at(argument3,lx-camera.focus.x,lz-camera.focus.z,ly-camera.focus.y,800,1600,1,false,5)
