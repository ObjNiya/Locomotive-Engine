if (distance_to_object(obj_player) < 25)
    magnetizeTarget = instance_nearest(x, y, obj_player);

if (!instance_exists(magnetizeTarget))
    exit;

move_towards_point(magnetizeTarget.x, magnetizeTarget.y, magnetizeSpd);
magnetizeSpd++;
