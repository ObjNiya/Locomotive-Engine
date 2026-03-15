palette_index += 0.035;
if (palette_index > sprite_get_width(spr_exitportal_palette))
    palette_index = 0;

pal_swap_set(spr_exitportal_palette, palette_index, false);
draw_self();
pal_swap_reset();