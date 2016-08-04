//sfx_play_at(x,y,z,index)

var lx=argument0;
var ly=argument1;
var lz=argument2;

if (config.SFX_ENABLED)
    audio_play_sound_at(argument3,-(get_draw_x(lx,ly)-camera.x),get_draw_y(ly,lz)-camera.y,300,800,1600,1,false,5)
