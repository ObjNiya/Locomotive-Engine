function IsShowtime()
{
    return global.showtime_timer.state == TIMER_STATES.STARTED;
}

function is_secret()
{
    return instance_exists(obj_secret_marker);
}