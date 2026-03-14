/// @ignore
function state_player_jump_to_background_start()
{
    sprite_index = spr_lookdoor;
    image_index = image_number - 1;
    image_speed = 0;
    
    visual_xscale = abs(visual_xscale);
    
    movespeed = 0;
    hsp = 0;
    vsp = -11;
    grav = 0.35;
}

/// @ignore
function state_player_jump_to_background_step()
{
    var required_scale = 0.3;
    var scaling_speed = 0.025;
    
    visual_xscale = approach(visual_xscale, required_scale, scaling_speed);
    visual_yscale = approach(visual_yscale, required_scale, scaling_speed);
    
    if (visual_xscale == required_scale && visual_yscale == required_scale)
        visible = false;
}

/// @ignore
function state_player_jump_to_background_end()
{
    visual_xscale = 1;
    visual_yscale = 1;
    
    grav = 0.5;
    
    visible = true;
}

/**
 * This function will return an array of the XY state events to be given to the ```smc_set_state``` function to change the X's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_jump_to_background()
{
    return [state_player_jump_to_background_start, state_player_jump_to_background_step, state_player_jump_to_background_end];
}