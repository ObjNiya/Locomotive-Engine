if (!visible)
    exit;

if (animation_end())
{
    if (sprite_index == spr_exitportal_close)
        visible = false;
    else if (sprite_index == spr_exitportal)
        sprite_index = spr_exitportal_close;
}

palette_index += 0.035;
if (palette_index > sprite_get_width(spr_exitportal_palette))
    palette_index = 0;