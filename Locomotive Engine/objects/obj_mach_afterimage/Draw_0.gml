with (spawner_id)
{
    if (!visible || place_meeting(x, y, [obj_secretegg, obj_secretegg_spawn]))
        exit;
}

draw_self();