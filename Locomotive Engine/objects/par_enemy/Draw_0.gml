var palette_swapping = sprite_exists(spr_palette);

if (palette_swapping)
    pal_swap_set(spr_palette, spr_palette_index, false);

visual_helper_draw_self();

if (palette_swapping)
    pal_swap_reset();