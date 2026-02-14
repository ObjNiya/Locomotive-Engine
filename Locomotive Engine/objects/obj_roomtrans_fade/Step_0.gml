var target_fade = real(!fade_in);

fade_alpha = approach(fade_alpha, target_fade, fade_speed);

if (fade_alpha != target_fade)
    exit;

if (fade_in)
{
    instance_destroy();
    exit;
}

fade_in = true;

goto_room();