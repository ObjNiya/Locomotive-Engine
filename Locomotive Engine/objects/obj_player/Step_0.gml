HITSTUN_STEP;

sound_instance_move_several([snd_grabdash, snd_groundpound, snd_mach, snd_superjump, snd_machroll, snd_dive, snd_roll_getup], x, y);

physics_step();
quick_log([PLAYER_HIT_WALL, PLAYER_HIT_CEILING, PLAYER_NOTHING_ABOVE])
coyote_step();
smc_step();
if (place_meeting(x, y, obj_levelpainting) && state_id == state_player_normal && dir == 0 && grounded)
    cam_painting_up.set_seek_target(1);
else
    cam_painting_up.set_seek_target(0);

camera.y_offsets[cam_painting_up_ind] = cam_painting_up.value * -120;
camera.step();