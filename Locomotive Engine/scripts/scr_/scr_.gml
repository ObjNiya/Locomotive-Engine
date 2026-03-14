function is_showtime()
{
    return global.showtime_timer.active && !instance_exists(obj_secret_marker)
}