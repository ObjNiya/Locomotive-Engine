fade_alpha = approach(fade_alpha, real(!fade_in), fade_speed);

if (fade_alpha < 1)
    exit;

with (obj_goto_room)
    event_user(0);