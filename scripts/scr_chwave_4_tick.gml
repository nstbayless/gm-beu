if (wave_timer%14==0) {
    if (wave_mob_spawned<wave_mob_max) {
        wave_mob_spawned++;
        var lx = arena0.x
        var ly = arena0.y;
        var lw = arena0.width;
        var lh = arena0.height;
        var margin = 16;
        var mobtype=mob_slime;
        if (wave_mob_spawned<6)
            mobtype=mob_bat;
        var mob = instance_create_xyz(lx+random(lw-2*margin)+margin,ly+random(lh-2*margin)+margin,5+random(40),mobtype);
        mob.on_death=scr_chwave_mob_death_counter;
        mob.bounce_max=14;
    }
}
