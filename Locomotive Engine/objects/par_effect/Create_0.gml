spawnedBy = noone;

Draw = function()
{
    if (paletteSpr != -1)
        pal_swap_set(paletteSpr, paletteIndex, false);
    
    draw_self();
    pal_swap_reset();
}