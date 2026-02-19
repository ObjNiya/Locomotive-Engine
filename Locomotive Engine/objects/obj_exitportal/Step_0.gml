animation_end_ext((sprite_index == spr_exitportal_close), spr_exitportal);

palette_index += 0.035;
if (palette_index > sprite_get_width(spr_exitportal_palette))
    palette_index = 0;