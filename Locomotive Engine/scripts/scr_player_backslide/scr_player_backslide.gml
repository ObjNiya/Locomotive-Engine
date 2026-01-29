/// @ignore
function state_player_backslide_start()
{
    vsp = (grounded) ? -3 : max(vsp, 3);
    movespeed = max(movespeed, 12);
    
    sprite_index = spr_rolling_jump;
    mask_index = spr_crouchmask;
}

/// @ignore
function state_player_backslide_step()
{
    hurt_enemy();
    
    if (player_check_can_get_up())
    {   
        state_machine_set_state(state_player_mach());
        sprite_index_set(spr_machroll_getup, 0);
        
        return;
    }
    
    if (place_meeting(x + dir, y, obj_solid))
        dir *= -1;
    
    hsp = movespeed * dir;
    
    image_xscale = side(dir, image_xscale);
    
    if (grounded && sprite_index == spr_rolling_jump)
        sprite_index_set(spr_backslide_land, 0);
    else if (!grounded)
        sprite_index = spr_rolling_jump;
    
    animation_end_ext((sprite_index == spr_backslide_land), spr_backslide);
}

/// @ignore
function state_player_backslide_end()
{
    mask_index = spr_player_mask;
}

/**
 * This function will return an array of the player's backslide state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_backslide()
{
    return [state_player_backslide_start, state_player_backslide_step, state_player_backslide_end];
}