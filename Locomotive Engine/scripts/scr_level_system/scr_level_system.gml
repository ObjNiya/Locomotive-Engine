function goto_level(lvl)
{
    CATCH_UNDEFINED_LVL;
    
    global.level = lvl;
    
    var event_desc = fmod_studio_system_get_event(global.level.title_music);
    
    
        queue_room(rm_titlecard, obj_spawn_a);
    
    trans_room(obj_roomtrans_fade, -1);
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