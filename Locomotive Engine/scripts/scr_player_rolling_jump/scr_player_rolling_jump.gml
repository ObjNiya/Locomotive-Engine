/// @ignore
function state_player_rolling_jump_start()
{
    movespeed = max(movespeed, 12);
    
    grav = 1;
    vsp = (grounded) ? -6 : max(vsp, 6);
    
    sprite_index = spr_rolling_jump;
    mask_index = spr_crouchmask;
    
    blur_afterimage_timer.Start();
    instakillmove = true;
}

/// @ignore
function state_player_rolling_jump_step()
{
    PlayerDoInstakill();
    destroy_blocks(x + hsp, y, [obj_block_metal, obj_block_metal_tiles]);
    
    if (PlayerHitWall())
    {
        mach_afterimage_use_alpha = false;
        mach_afterimage_timer.Start();
        
        image_xscale *= -1;
        dir *= -1;
    }
    
    hsp = movespeed * dir;
    
    if (!grounded)
        return;
    
    smc_set_state((hsp == 0) ? state_player_normal : state_player_machroll);
}

/// @ignore
function state_player_rolling_jump_end()
{
    mask_index = spr_player_mask;
    
    grav = 0.5;
    
    instakillmove = false;
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.Stop();
    blur_afterimage_timer.Stop();
}

/**
 * This function will return an array of the player's rolling_jump state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_rolling_jump()
{
    return [state_player_rolling_jump_start, state_player_rolling_jump_step, state_player_rolling_jump_end];
}