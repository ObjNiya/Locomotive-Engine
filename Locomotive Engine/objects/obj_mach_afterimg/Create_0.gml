event_inherited();

visibleOverride = true;
color = c_white;
spawnedByPrevX = 0;

alarm[0] = 1;
alarm[1] = 3;
alarm[2] = real(lifespan);

Draw = function()
{
    if (!visibleOverride)
        exit;
    
    ColorMixSet(COLOR_MIX_MODES.MIX_ALT, 0.5, color, true);
    draw_self();
    shader_reset();
}