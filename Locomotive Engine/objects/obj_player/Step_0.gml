HITSTUN_STEP;

global.leadingPlayer = id;


//StepTimers(taunt_timer, note_particle_timer, cloud_particle_timer, air_cloud_particle_timer, flame_particle_timer, downwards_woosh_particle_timer, upwards_woosh_particle_timer, 
  //      blur_afterimage_timer, mach_afterimage_timer, hurtFlickerTimer);
HitboxesStep(hitbox, parryHitbox);

HurtSysStep();
scr_collision();
CoyoteTimeStep();
SmcRunEvent(STATE_EVENTS.STEP);

sound_instance_move_several(x, y, sndGrabdash, sndGroundpound, sndMach, sndSuperjump, sndMachroll, sndDive, sndRollGetup);

var cam_pan_up = (place_meeting(x, y, obj_levelpainting) && stateName == "Normal" && dir == 0 && grounded);
camPaintingUp.set_seek_target(real(cam_pan_up));
camera.y_offsets[camPaintingUpInd] = camPaintingUp.value * -120;

CameraStep(camera);