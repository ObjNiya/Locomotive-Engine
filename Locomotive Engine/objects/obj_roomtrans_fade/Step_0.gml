var target_fade = real(!fade_in);

image_alpha = approach(image_alpha, target_fade, fade_speed);

if (image_alpha != target_fade)
    exit;

if (--end_lag > 0)
    exit;

if (fade_in)
{
    instance_destroy();
    exit;
}

with (obj_player)
    frozen = false;
fade_in = true;

goto_room();