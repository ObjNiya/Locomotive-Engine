if (HitstunStep())
{
    camera.Step();
    exit;
}

global.leadingPlayer = id;

// Decrement Timers

invincibilityTime--;
grabdashcloudPartTimer--;
dashcloudPartTimer--;
mach3cloudPartTimer--;
horizRingPartTimer--;

// Update Systems

CoyoteTimeStep();
SmcRunEvent("Step");
scr_collision();
camera.Step();
PrlxStep(camera.camId);

if (sndsInitialized)
    sound_instance_move_several(x, y, sndGrabdash, sndGroundpound, sndMach, sndSuperjump, sndMachroll, sndDive, sndRollGetup, sndSpin);

if (y < -800 || y > room_height + 300)
    event_user(PLAYER_UEVS.TECHDIFFICULTIES);