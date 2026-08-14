if (!showtimeSpawn)
    exit;

with (InstanceCreate(x, y, obj_showtime_enemyspawn))
    enemyId = other.id;
instance_deactivate_object(id);