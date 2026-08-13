with (spawner_id)
{
    if (!visible || place_meeting(x, y, [obj_secretegg, obj_secretegg_spawn]))
        exit;
}

SetColorMix(COLOR_MIX_MODES.OVERLAY, 0.5, color);
draw_self();
shader_reset();