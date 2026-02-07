/// @ignore
function state_player_cape_fall_start()
{
    sprite_index_set(spr_cape_end, 0);
    
    acceleration = 0.75;
    
    mach_afterimage_timer.start();
}

/// @ignore
function state_player_cape_fall_step()
{
    if (player_check_can_grabdash())
    {
        state_machine_set_state(state_player_grabdash());
        return;
    }
    
    if (player_check_can_taunt())
    {
        state_machine_set_state(state_player_taunt());
        return;
    }
    
    if (player_check_can_wallclimb())
    {
        state_machine_set_state(state_player_wallclimb());
        return;
    }
    
    animation_end_ext((sprite_index == spr_cape_end), spr_cape_fall);
    
    dir = side(sign(InputX(INPUT_CLUSTER.NAVIGATION)), visual_xscale);
    
    if (abs(hsp) < 12 || dir == -sign(hsp))
        hsp += acceleration * dir;
    
    movespeed = abs(hsp);
    visual_xscale = dir;
    
    if (grounded)
    {
        movespeed = max(12, movespeed);
        
        if (player_check_can_machrun())
            state_machine_set_state(state_player_mach());
        else
        {
            state_machine_set_state(state_player_normal());
            sprite_index_set(spr_fall, 0);
        }
    }
}

/// @ignore
function state_player_cape_fall_end()
{
    mach_afterimage_timer.stop();
}

/**
 * This function will return an array of the player cape fall state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_cape_fall()
{
    return [state_player_cape_fall_start, state_player_cape_fall_step, state_player_cape_fall_end];
}