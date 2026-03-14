HITSTUN_STEP;

sound_instance_move_several([snd_grabdash, snd_groundpound, snd_mach, snd_superjump, snd_machroll, snd_dive, snd_roll_getup], x, y);

scr_collision();
coyote_step();
smc_step();