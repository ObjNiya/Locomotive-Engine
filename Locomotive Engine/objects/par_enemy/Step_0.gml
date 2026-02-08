position_sounds([snd_stunned]);
scr_collision();
state_machine_step();
combat_step();

bird.x = x;
bird.y = y - 40;