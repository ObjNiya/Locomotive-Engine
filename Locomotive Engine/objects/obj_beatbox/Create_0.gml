depth = DEPTHS.FARTHEST;

scr_collision_init();
grav = 0.5;
terminalVelocity = 20;

player = noone;

sound_instance_one_shot(sfx_player_breakdance_voice, x, y);
beatboxMusic = sound_instance_create(sfx_player_breakdance);
sound_instance_start(beatboxMusic);