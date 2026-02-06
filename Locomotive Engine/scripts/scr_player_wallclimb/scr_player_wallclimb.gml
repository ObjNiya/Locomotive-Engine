/// @ignore
function state_player_wallclimb_start()
{
    sprite_index = spr_wallclimb;
    
    vertical_movespeed = movespeed;
    vertical_movespeed = max(0, vertical_movespeed);
    
    hsp = 0;
    movespeed = 0;
    grav = 0;
    
    mach_afterimage_timer.start();
}

/// @ignore
function state_player_wallclimb_step()
{
    wallclimb_grab_buffer--;
    
    if (!InputCheck(INPUT_VERB.MACHRUN) && wallclimb_grab_buffer <= 0)
    {
        state_machine_set_state(state_player_normal());
        
        hsp = -6 * dir;
        
        if (!InputCheck(INPUT_VERB.JUMP))
            vsp /= 20;
        
        return;
    }
    
    if (InputPressed(INPUT_VERB.JUMP))
    {
        state_machine_set_state(state_player_mach());
        sprite_index_set(spr_walljump_intro, 0);
        
        dir *= -1;
        visual_xscale = dir;
        
        vsp = jump_height;
        movespeed = 10;
        
        return;
    }
    
    if (player_check_hit_ceiling())
    {
        player_setup_hit_ceiling();
        return;
    }
    
    if (InputPressed(INPUT_VERB.GRABDASH) && sprite_index != spr_wallclimb_dash)
    {
        sprite_index = spr_wallclimb_dash;
        
        wallclimb_dash_timer.start();
    }
    
    wallclimb_dash_timer.step();
    
    var acceleration = (sprite_index == spr_wallclimb_dash) ? 0.3 : 0.15;
    
    if (vertical_movespeed < 20)
        vertical_movespeed += acceleration;
    
    vsp = -vertical_movespeed;
    
    if (!player_check_hit_wall())
    {
        movespeed = abs(vsp);
        vsp = 0;
        
        state_machine_set_state(state_player_mach());
        
        return;
    }
}

/// @ignore
function state_player_wallclimb_end()
{
    grav = 0.5;
    
    wallclimb_dash_timer.stop();
    mach_afterimage_timer.stop();
}

/**
 * This function will return an array of the player's wallclimb state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_wallclimb()
{
    return [state_player_wallclimb_start, state_player_wallclimb_step, state_player_wallclimb_end];
}