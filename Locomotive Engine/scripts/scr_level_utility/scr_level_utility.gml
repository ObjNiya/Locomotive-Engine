function is_showtime()
{
    return global.showtime_timer.active && !global.showtime_timer.paused
}

function is_secret()
{
    return instance_exists(obj_secret_marker);
}