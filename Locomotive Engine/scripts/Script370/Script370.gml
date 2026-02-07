function hitstun_initialize()
{
    hitstun_x = x;
    hitstun_y = y;
    hitstun_time = 8;
    
    hitstun_sprite = -1;
    
    hitstun_timer = new Timer(hitstun_time, time_source_units_frames, function() {
        x = hitstun_x;
        y = hitstun_y;
    })
}

function hitstun_apply()
{
    hitstun_x = x;
    hitstun_y = y;
    
    if (hitstun_sprite != -1)
        sprite_index_set(hitstun_sprite, 0);
    
    hitstun_timer.max_time = hitstun_time;
    hitstun_timer.start();
}

function hitstun_step()
{
    if (hitstun_timer.active)
    {
        x = hitstun_x + irandom_range(-4, 4);
        y = hitstun_y + irandom_range(-4, 4);

        return true;
    }
    
    return false;
}