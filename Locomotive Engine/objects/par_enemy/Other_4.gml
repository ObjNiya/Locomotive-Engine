if (!showtimeSpawn)
    exit;

with (InstanceCreate(x, y, obj_showtime_spawner))
    enemyId = other.id;
instance_deactivate_object(id);