// Built-ins

depth = DEPTHS.BACK;

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

cloudPartTimer = new Timer(5, time_source_units_frames, function() {
    var offset = irandom_range(-40, 40);
    instance_create(x + offset, y + offset, obj_cloud_particle);
});
cloudPartTimer.SetRepeating(false, true);
cloudPartTimer.Start();