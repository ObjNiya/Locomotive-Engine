if (paletteSpr != -1)
    pal_swap_set(paletteSpr, paletteIndex, false);
draw_self();
if (paletteSpr != -1)
    pal_swap_reset();

