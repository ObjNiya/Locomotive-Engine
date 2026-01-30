/// @ignore
function state_tv_idle_start()
{ 
    if (sprite_index != spr_tv_turnon_damian)
        sprite_index = spr_tv_idle_damian;
    
    idle_animation_timer.start();
}

/// @ignore
function state_tv_idle_step()
{
    if (sprite_index == spr_tv_turnon_damian)
    {
        animation_end(spr_tv_idle_damian);
        return;
    }
    
    animation_end_ext((equals_to_either(sprite_index, [spr_tv_idle_animation1, spr_tv_idle_animation2])), spr_tv_idle_damian);
}

/// @ignore
function state_tv_idle_end()
{
    idle_animation_timer.stop();
}

/**
 * This function will return an array of the tv idle state events to be given to the ```state_machine_set_state``` function to change the tv's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_tv_idle()
{
    return [state_tv_idle_start, state_tv_idle_step, state_tv_idle_end];
}