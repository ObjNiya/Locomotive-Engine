/**
 * Returns whether or not the Showtime/Escape sequence is active.
 * @pure
 */
function IsShowtime()
{
    return global.showtimeTimer.state == TIMER_STATES.STARTED;
}


/**
 * Begins the Showtime/Escape sequence.
 */
function StartShowtime()
{
    global.showtimeTimer.Start();
    
    with (obj_player)
        camera.shake_set(3, 0);
    MusicSet(mu_showtime)
    
    InstanceDestroySafe(obj_its_showtime);
    InstanceCreate(0, 0, obj_its_showtime);
}