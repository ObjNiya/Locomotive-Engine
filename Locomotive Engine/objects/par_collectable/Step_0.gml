if (distance_to_object(par_player) < 25)
    magnetize_target_id = instance_nearest(x, y, par_player);

if (!instance_exists(magnetize_target_id))
    exit;

move_towards_point(magnetize_target_id.x, magnetize_target_id.y, magnetize_speed);
magnetize_speed++;
