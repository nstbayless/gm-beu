if (wave_timer%23==0) {
    if (wave_mob_spawned<wave_mob_max) {
        var margin = 16;
        var lx = arena0.x+margin;
        var ly = arena0.y+margin;
        var lh = arena0.height-2*margin;
        var lw = arena0.width-2*margin;
        sp_x=0;
        sp_y=0;
        var p = (wave_mob_spawned/12.34) % 1
        if (p<0.3) {
            sp_x=p/0.3
        } else if (p<0.5) {
            sp_y = (p-0.3)/0.2
            sp_x=1;
        } else if (p<0.8) {
            sp_x=1-(p-0.5)/0.3;
            sp_y=1;
        } else {
            sp_y = 1-(p-0.8)/0.2
        }
        
        var mob = instance_create_xyz(lx+lw*sp_x,ly+sp_y*lh,32,mob_slime);
        mob.on_death=scr_chwave_mob_death_counter;
        wave_mob_spawned++;
    }
}
