#macro HITSTUN_STEP if (hitstun_step()) exit

/**
 * This function will create all the necessary variables to later apply hitstun on the current instance.
 */
function hitstun_initialize()
{
    hitstun_x = x;
    hitstun_y = y;
    
    hitstun_time = 5;
    hitstun_shake_magnitude = 4;
    
    previous_sprite = sprite_index;
    hitstun_sprite = -1;
    
    hitstun_timer = new Timer(hitstun_time, time_source_units_frames, function() {
        x = hitstun_x;
        y = hitstun_y;
    })
}

/**
 * This function will apply hitstun for 5 frames on the current instance.
 */
function hitstun_apply()
{
    hitstun_x = x;
    hitstun_y = y;
    
    if (hitstun_sprite != -1)
    {
        previous_sprite = sprite_index;
        sprite_set(hitstun_sprite, 0);
    }
    
    hitstun_timer.max_time = hitstun_time;
    hitstun_timer.start();
}

/**
 * This function updates the hitstun timer on the current instance, to be called in step. The function returns whether or not hitstun is currently active, as you
 * are supposed to exit out of your step event while it is.
 * @returns {Bool}
 */
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