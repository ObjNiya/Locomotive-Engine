HITSTUN_STEP;
global.leadingPlayer = id;
invincibilityTime--;

CoyoteTimeStep();
scr_collision();
SmcRunEvent("Step");
if (sndsInitialized)
    sound_instance_move_several(x, y, sndGrabdash, sndGroundpound, sndMach, sndSuperjump, sndMachroll, sndDive, sndRollGetup, sndSpin);
CameraStep(camera);
PrlxStep(camera.id);

var cam_pan_up = (place_meeting(x, y, obj_levelpainting) && stateName == "Normal" && dir == 0 && grounded);
camPaintingUp.set_seek_target(real(cam_pan_up));
camera.y_offsets[camPaintingUpInd] = camPaintingUp.value * -120;

if ((y >= -800 && y < room_height + 300) || instance_exists(par_cutscene))
    exit;

var techdifficulties = CreateCutscene(seq_techdifficulties, false, false);
techdifficulties.endEvent = function()
{
    SpawnGoto();
    InstanceCreate(0, 0, obj_techdifficulties_out);
    with (obj_player)
        SmcSetState("Normal");
}

with (techdifficulties)
    DepthSet(DEPTHS.HIGHEST);

SmcSetState("Nothing", false, false);