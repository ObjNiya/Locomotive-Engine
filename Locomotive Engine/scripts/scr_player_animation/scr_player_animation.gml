/// @ignore
function state_player_animation_start()
{
    image_index = 0;
}

/// @ignore
function state_player_animation_step()
{
    hsp = movespeed * sign(image_xscale);
    
    if (grounded)
        movespeed = 0;
    
    if (animation_end())
        state_machine_set_state(state_player_normal());
}

/// @ignore
function state_player_animation_end()
{
    grav = 0.5;
}

/// @description This function will return an array containing the animation states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_animation()
{
    return [state_player_animation_start, state_player_animation_step, state_player_animation_end];
}