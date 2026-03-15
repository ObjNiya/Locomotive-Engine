function goto_level(lvl, transition_obj = obj_roomtrans_fade)
{
    CATCH_UNDEFINED_LVL;
    
    global.level = lvl;
    
    queue_room(rm_titlecard, obj_spawn_a);
    
    return trans_room(transition_obj, -1);
}

function add_combo(value, time)
{
    with (global)
    {
        combo = max(combo + value, 0);
        
        if (combo <= 0)
            return false;
        
        combo_timer.time = clamp(combo_timer.time + time, 0, 6.75);
    }
}