position_sounds([snd_grabdash, snd_groundpound, snd_mach, snd_superjump, snd_machroll, snd_dive, snd_roll_getup]);

if (hitstun_step())
    return;

scr_collision();
coyote_manager_step();
state_machine_step();
combat_step();