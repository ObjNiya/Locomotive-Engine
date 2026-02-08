function hitstun_initialize()
{
    hitstun_x = x;
    hitstun_y = y;
    hitstun_time = 8;
    hitstun_shake_magnitude = 4;
    
    previous_sprite = sprite_index;
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
    {
        previous_sprite = sprite_index;
        sprite_index_set(hitstun_sprite, 0);
    }
    
    hitstun_timer.max_time = hitstun_time;
    hitstun_timer.start();
}

function hitstun_step()
{
    if (hitstun_timer.active)
    {
        x = hitstun_x + irandom_range(-hitstun_shake_magnitude, hitstun_shake_magnitude);
        y = hitstun_y + irandom_range(-hitstun_shake_magnitude, hitstun_shake_magnitude);
        
        animation_end_ext((sprite_index == hitstun_sprite), previous_sprite);
        
        return true;
    }
    
    return false;
}