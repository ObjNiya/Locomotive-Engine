function add_points(amount, effect_amount = 0)
{
    with (obj_level_system)
        points += amount;
}

function add_combo(amount, time)
{
    with (obj_level_system)
    {
        combo += amount;
        
        if (!combo_timer.active)
            combo_timer.start();
        else
            combo_timer.time += time;
    }
}

function is_showtime()
{
    with (obj_level_system)
        return (showtime_timer.active && !showtime_timer.paused);
    
    return false;
}