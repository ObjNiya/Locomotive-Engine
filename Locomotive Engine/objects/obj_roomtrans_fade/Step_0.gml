var target_fade = real(!fade_in);

fade_alpha = approach(fade_alpha, target_fade, fade_speed);

if (fade_alpha != target_fade)
    exit;

if (fade_in)
{
    instance_destroy();
    exit;
}

with (par_player)
    frozen = false;
fade_in = true;

goto_room();