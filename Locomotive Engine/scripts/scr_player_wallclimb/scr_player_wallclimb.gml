/// @ignore
function state_player_wallclimb_start()
{
    sprite_index = spr_wallclimb;
    
    vertical_movespeed = movespeed;
    vertical_movespeed = max(0, vertical_movespeed);
    
    vertical_acceleration = 0.15;
    
    hsp = 0;
    movespeed = 0;
    grav = 0;
    
    mach_afterimage_timer.start();
    
    sound_instance_start(snd_mach);
    sound_instance_set_parameter_by_name(snd_mach, "Grounded", true);
    sound_instance_set_parameter_by_name(snd_mach, "State", 1);
}

/// @ignore
function state_player_wallclimb_step()
{
    wallclimb_grab_buffer--;
    
    if (!InputCheck(INPUT_VERB.MACHRUN) && wallclimb_grab_buffer <= 0)
    {
        smc_set_state(state_player_normal);
        
        hsp = -6 * dir;
        
        if (!InputCheck(INPUT_VERB.JUMP))
            vsp /= 20;
        
        return;
    }
    
    if (InputPressed(INPUT_VERB.JUMP))
    {
        smc_set_state(state_player_mach);
        sprite_index_set(spr_walljump_intro, 0);
        
        sound_instance_one_shot(sfx_jump, x, y);
        
        dir *= -1;
        image_xscale = dir;
        
        vsp = jump_height;
        movespeed = 10;
        
        return;
    }
    
    if (PLAYER_HIT_CEILING)
    {
        player_setup_hit_ceiling();
        return;
    }
    
    if (InputPressed(INPUT_VERB.GRABDASH) && sprite_index != spr_wallclimb_dash)
    {
        sprite_index = spr_wallclimb_dash;
        
        wallclimb_dash_timer.start();
        
        sound_instance_start(snd_grabdash);
        create_flash_effect(true);
    }
    
    wallclimb_dash_timer.step();
    
    vertical_acceleration = (sprite_index == spr_wallclimb_dash) ? 0.3 : 0.15;
    
    if (vertical_movespeed < 20)
        vertical_movespeed += vertical_acceleration;
    
    vsp = -vertical_movespeed;
    
    if (!PLAYER_HIT_WALL)
    {
        movespeed = abs(vsp);
        vsp = 0;
        
        smc_set_state(state_player_mach);
        
        return;
    }
}

/// @ignore
function state_player_wallclimb_end()
{
    grav = 0.5;
    
    wallclimb_dash_timer.stop();
    mach_afterimage_timer.stop();
    
    sound_instance_stop(snd_mach, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
    sound_instance_stop(snd_grabdash, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}

/**
 * This function will return an array of the player's wallclimb state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_wallclimb()
{
    return [state_player_wallclimb_start, state_player_wallclimb_step, state_player_wallclimb_end];
}