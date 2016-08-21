//scr_chwave_end
//ends wave
with (obj_actor) {
    if (on_death==scr_chwave_mob_death_counter)
        kill();
}

wave++;
wave_active=false;
wave_started=false;
