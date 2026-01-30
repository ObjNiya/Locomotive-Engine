/// @ignore
function state_player_animation_start()
{
    image_index = 0;
}

/// @ignore
function state_player_animation_step()
{
    if (grounded)
        movespeed = 0;
    
    hsp = movespeed * dir;
    
    visual_xscale = side(visual_xscale, dir);
    
    if (animation_end())
        state_machine_set_state(state_player_normal());
}

/// @ignore
function state_player_animation_end()
{
    grav = 0.5;
}

/**
 * This function will return an array of the player's animation state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_animation()
{
    return [state_player_animation_start, state_player_animation_step, state_player_animation_end];
}