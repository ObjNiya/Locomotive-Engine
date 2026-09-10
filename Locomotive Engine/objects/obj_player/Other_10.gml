/**
 * Technical Difficulties
 */

if (instance_exists(obj_seq_cutscene))
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

