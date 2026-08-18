// Built-ins



grav = 0.4;
hsp = random_range(-10, -18);
vsp = random_range(-10, -18);

onGui = false;
collideBuffer = 10;

paletteSpr = -1;
paletteIndex = 0;

draw = function()
{
    if (sprite_exists(paletteSpr))
        pal_swap_set(paletteSpr, paletteIndex, false);
    
    draw_self();
    pal_swap_reset();
}