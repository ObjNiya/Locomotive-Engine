HITSTUN_STEP;

StepTimers(taunt_timer, note_particle_timer, cloud_particle_timer, air_cloud_particle_timer, flame_particle_timer, downwards_woosh_particle_timer, upwards_woosh_particle_timer, 
        blur_afterimage_timer, mach_afterimage_timer, hurtFlickerTimer);
stepHitboxes(hitbox, parryHitbox);

hurtSysStep();
scr_collision();
coyote_step();
SmcRunEvent(STATE_EVENTS.STEP);

sound_instance_move_several(x, y, snd_grabdash, snd_groundpound, snd_mach, snd_superjump, snd_machroll, snd_dive, snd_roll_getup);

var cam_pan_up = (place_meeting(x, y, obj_levelpainting) && stateName == "Normal" && dir == 0 && grounded);
cam_painting_up.set_seek_target(real(cam_pan_up));
camera.y_offsets[cam_painting_up_ind] = cam_painting_up.value * -120;

CameraStep(camera);