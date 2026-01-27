visible = !visible;
alarm[0] = irandom_range(2, 4);

if (flicker_count++ >= 3)
    instance_destroy();

if (!visible)
    exit;

if (color_cycle++ > array_length(colors) - 1)
    color_cycle = 0