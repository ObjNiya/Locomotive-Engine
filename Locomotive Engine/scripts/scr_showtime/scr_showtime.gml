/**
 * Returns whether or not the Showtime/Escape sequence is active.
 * @pure
 */
function IsShowtime()
{
    return time_source_get_state(global.showtimeTimer) == time_source_state_active;
}


/**
 * Begins the Showtime/Escape sequence.
 */
function StartShowtime()
{
    time_source_start(global.showtimeTimer);
    
    with (obj_player.camera)
    {
        ShakeSet(3, 0, 0);
        ShakeSetMin(3);
    }
    
    MusicSet(mu_showtime_damian);
    
    InstanceDestroySafe(obj_its_showtime);
    InstanceCreate(0, 0, obj_its_showtime);
}