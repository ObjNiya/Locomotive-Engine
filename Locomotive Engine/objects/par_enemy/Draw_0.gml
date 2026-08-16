if (paletteSpr != -1)
    pal_swap_set(paletteSpr, paletteIndex, false);
VhDrawSelf();
pal_swap_reset();

SmcRunEvent("Draw");