move_towards_point(obj_player.x, obj_player.y, movespeed);

if (distance_to_object(obj_player) <= 25 || movespeed > 0)
    movespeed++;