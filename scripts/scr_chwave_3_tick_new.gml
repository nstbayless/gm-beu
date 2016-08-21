if (wave_timer%3==0) {
    if (wave_mob_spawned<wave_mob_max) {
        wave_mob_spawned++;
        var lx = arena0.x+arena0.width;
        var ly = arena0.y;
        var lh = arena0.height;
        var margin = 16;
        var mob = instance_create_xyz(lx-margin,ly+random(lh-2*margin)+margin,32,mob_slime);
        mob.on_death=scr_chwave_mob_death_counter;
    }
}
