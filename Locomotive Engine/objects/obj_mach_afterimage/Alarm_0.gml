visible = !visible;
alarm[0] = irandom_range(2, 4);

if (flicker_count++ >= 4)
    instance_destroy();

color_cycle = irandom(array_length(colors) - 1);