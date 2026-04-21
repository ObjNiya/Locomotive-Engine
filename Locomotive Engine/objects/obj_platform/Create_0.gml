platform_direction = floor(image_angle / 90) + 1;
if (platform_direction > 4)
    platform_direction = 1;

event_inherited();