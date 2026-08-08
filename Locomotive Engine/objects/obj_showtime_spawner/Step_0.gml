if (!IsShowtime())
    exit;

if (distance_to_pos(x, y, obj_player.x, obj_player.y, 500, 100) && !visible)
{
    visible = true;
    image_index = 0;
    image_speed = 1.15;
}
else if (!visible || floor(image_index) <= 5 || instance_exists(enemyId))
    exit;

instance_activate_object(enemyId);
sound_instance_one_shot(sfx_showtime_spawn, x, y);

with (enemyId)
{
    x = other.x;
    y = other.y;
    
    create_particle(x, y, obj_puff_particle);
    
    if (!showtimeSpawnStun)
        exit;
    
    SmcSetState("Stunned");
    
    stunned_timer.maxTime = 20;
    stunned_timer.Start();
}