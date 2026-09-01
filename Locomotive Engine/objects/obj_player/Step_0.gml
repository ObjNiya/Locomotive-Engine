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

CoyoteTimeStep();
scr_collision();
SmcRunEvent("Step");
if (sndsInitialized)
    sound_instance_move_several(x, y, sndGrabdash, sndGroundpound, sndMach, sndSuperjump, sndMachroll, sndDive, sndRollGetup, sndSpin);
camera.Step();
PrlxStep(camera.camId);

if ((y >= -800 && y < room_height + 300) || instance_exists(par_cutscene))
    exit;

var techdifficulties = CreateCutscene(seq_techdifficulties, false, false);
var TechdifficultiesEnd = function()
{
    SpawnGoto();
    InstanceCreate(0, 0, obj_techdifficulties_out);
    with (obj_player)
	{
        SmcSetState("Normal");
        visible = true;
	}
}

with (techdifficulties)
{
    endEvent = TechdifficultiesEnd;
    
    SetLayer(PRIORITY.HIGH, false);
}

visible = false;
hsp = 0;
vsp = 0;
camera.ShakeSet(3, 0.05, 0);
PlayerDropCarrying();

sound_instance_one_shot(sfx_player_groundpound_land, x, room_height - 100);
SmcSetState("Nothing");

