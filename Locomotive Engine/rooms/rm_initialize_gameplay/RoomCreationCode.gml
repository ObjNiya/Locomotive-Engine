with (obj_roomtrans_fade)
{
    fade_alpha = 1.5;
    fade_speed = 0.05;
}

queue_room(rm_test, obj_spawn_a);

var skip = true;

if (skip)
    goto_room();