if (alarm[0] != -1)
    exit;

var on_screen = !ArrayIsEmpty(CameraPlaceArray(x, y));
fmod_studio_system_set_parameter_by_name("Pillar Music", real(on_screen));

var attacked = false;

with (obj_player)
{
    if (!place_meeting(PlayerPredictX(), y, other) || (!instakillHitbox.canAttack && stateName != "Mach" && stateName != "Machroll" && stateName != "Grabdash"))
        continue;
    
    attacked = true;
    break;
}

if (!attacked)
    exit;

CreateCutscene(seq_pillar_destroy, false, false);
var len = sequence_get(seq_pillar_destroy).length;

with (obj_player)
{
    HitstunSet(len);
    
    camera.ShakeSet(3, 0, 0);
    camera.ShakeSetMin(3);
    
    var part_x = bbox_right;
    if (image_xscale == -1)
    {
        other.playerDir = -1;
        part_x = bbox_left;
    }
    
    PartSpawn(part_x, y, PART_TYPES.PARRYSPARK);
    PartSpawn(part_x, y, PART_TYPES.SPARK);
    
    sound_instance_one_shot(sfx_playerpunch, x, y);
}

alarm[0] = len;
