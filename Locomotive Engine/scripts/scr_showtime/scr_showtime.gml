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
    
    with (obj_player)
        camera.shake_set(3, 0);
    MusicSet(mu_showtime)
    
    InstanceDestroySafe(obj_its_showtime);
    InstanceCreate(0, 0, obj_its_showtime);
}