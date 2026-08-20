HITSTUN_STEP;
global.leadingPlayer = id;
invincibilityTime--;

CoyoteTimeStep();
scr_collision();
SmcRunEvent("Step");
sound_instance_move_several(x, y, sndGrabdash, sndGroundpound, sndMach, sndSuperjump, sndMachroll, sndDive, sndRollGetup, sndSpin);
CameraStep(camera);
PrlxStep(camera.id);


var cam_pan_up = (place_meeting(x, y, obj_levelpainting) && stateName == "Normal" && dir == 0 && grounded);
camPaintingUp.set_seek_target(real(cam_pan_up));
camera.y_offsets[camPaintingUpInd] = camPaintingUp.value * -120;