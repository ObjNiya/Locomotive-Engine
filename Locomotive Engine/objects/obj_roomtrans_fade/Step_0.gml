var target_fade = real(!fade_in);

fade_alpha = approach(fade_alpha, target_fade, fade_speed);

if (fade_alpha != target_fade)
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