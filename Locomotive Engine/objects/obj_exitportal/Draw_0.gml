paletteIndex += 0.035;
if (paletteIndex > sprite_get_width(spr_exitportal_palette))
    paletteIndex = 0;

pal_swap_set(spr_exitportal_palette, paletteIndex, false);
draw_self();
pal_swap_reset();