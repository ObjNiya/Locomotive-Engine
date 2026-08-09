function IsShowtime()
{
    return global.showtime_timer.state == TIMER_STATES.STARTED;
}

function StartShowtime()
{
    global.showtime_timer.Start();
    
    with (obj_player)
        camera.shake_set(3, 0);
    SetMusic(mu_showtime)
    
    InstanceDestroySafe(obj_its_showtime);
    InstanceCreate(0, 0, obj_its_showtime);
}