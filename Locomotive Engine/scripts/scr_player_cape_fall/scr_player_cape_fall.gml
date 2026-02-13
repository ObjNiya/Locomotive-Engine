/// @ignore
function state_player_cape_fall_start()
{
    sprite_set(spr_cape_end, 0);
    
    accel = 0.75;
    
    mach_afterimage_timer.start();
}

/// @ignore
function state_player_cape_fall_step()
{
    if (PLAYER_GRABDASH)
    {
        smc_set_state(state_player_grabdash);
        return;
    }
    
    if (PLAYER_TAUNT)
    {
        smc_set_state(state_player_taunt);
        return;
    }
    
    if (PLAYER_WALLCLIMB)
    {
        smc_set_state(state_player_wallclimb);
        return;
    }
    
    animation_end_ext((sprite_index == spr_cape_end), spr_cape_fall);
    
    dir = side(sign(InputX(INPUT_CLUSTER.NAVIGATION)), image_xscale);
    
    if (abs(hsp) < 12 || dir == -sign(hsp))
        hsp += accel * dir;
    
    movespeed = abs(hsp);
    image_xscale = dir;
    
    if (grounded)
    {
        movespeed = max(12, movespeed);
        
        if (PLAYER_MACHRUN)
            smc_set_state(state_player_mach);
        else
        {
            smc_set_state(state_player_normal);
            sprite_set(spr_fall, 0);
        }
    }
}

/// @ignore
function state_player_cape_fall_end()
{
    mach_afterimage_timer.stop();
}

/**
 * This function will return an array of the player cape fall state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_cape_fall()
{
    return [state_player_cape_fall_start, state_player_cape_fall_step, state_player_cape_fall_end];
}