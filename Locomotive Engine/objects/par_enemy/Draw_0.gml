var palette_swapping = sprite_exists(spr_palette);

if (palette_swapping)
    pal_swap_set(spr_palette, spr_palette_index, false);

vh_draw_self();

if (palette_swapping)
    pal_swap_reset();

if (state_id == state_enemy_stunned)
    bird.draw();