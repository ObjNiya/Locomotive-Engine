var pal_swap = (sprite_exists(pal_sprite));

if (pal_swap)
    pal_swap_set(pal_sprite, pal_index, false);

draw_self();

if (pal_swap)
    pal_swap_reset();