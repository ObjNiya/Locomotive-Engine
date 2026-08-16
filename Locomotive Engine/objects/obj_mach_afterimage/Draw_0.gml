with (spawner_id)
{
    if (!visible || place_meeting(x, y, [obj_secretegg, obj_secretegg_spawn]))
        exit;
}

ColorMixSet(COLOR_MIX_MODES.MIX_ALT, 0.5, color, true);
draw_self();
shader_reset();