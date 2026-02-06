/// @ignore
function state_player_rolling_jump_start()
{
    movespeed = max(movespeed, 12);
    
    grav = 1;
    vsp = (grounded) ? -6 : max(vsp, 6);
    
    sprite_index = spr_rolling_jump;
    mask_index = spr_crouchmask;
    
    blur_afterimage_timer.start();
}

/// @ignore
function state_player_rolling_jump_step()
{
    hurt_enemy();
    
    if (player_check_hit_wall())
    {
        mach_afterimage_use_alpha = false;
        mach_afterimage_timer.start();
        
        visual_xscale *= -1;
        dir *= -1;
    }
    
    hsp = movespeed * dir;
    
    if (!grounded)
        return;
    
    state_machine_set_state(state_player_machroll());
}

/// @ignore
function state_player_rolling_jump_end()
{
    mask_index = spr_player_mask;
    
    grav = 0.5;
    
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.stop();
    blur_afterimage_timer.stop();
}

/**
 * This function will return an array of the player's rolling_jump state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_rolling_jump()
{
    return [state_player_rolling_jump_start, state_player_rolling_jump_step, state_player_rolling_jump_end];
}