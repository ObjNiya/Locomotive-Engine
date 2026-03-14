/// @ignore
function state_player_wallclimb_start()
{
    sprite_index = spr_wallclimb;
    
    vert_movespeed = movespeed;
    vert_movespeed = max(0, vert_movespeed);
    
    vert_accel = 0.15;
    
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
    
    destroy_blocks(x, y + vsp, [obj_block_metal, obj_block_metal_tiles]);
    
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
        movespeed = 10;
        dir *= -1;
        image_xscale = dir;
        
        smc_set_state(state_player_mach);
        player_do_jump(true, spr_walljump_intro);
        
        return;
    }
    
    if (player_do_ceilingsplat())
        return;
    
    if (InputPressed(INPUT_VERB.GRABDASH) && sprite_index != spr_wallclimb_dash)
    {
        sprite_index = spr_wallclimb_dash;
        
        wallclimb_dash_timer.start();
        
        sound_instance_start(snd_grabdash);
        create_flash_effect(true);
    }
    
    wallclimb_dash_timer.step();
    
    vert_accel = (sprite_index == spr_wallclimb_dash) ? 0.3 : 0.15;
    
    if (vert_movespeed < 20)
        vert_movespeed += vert_accel;
    
    vsp = -vert_movespeed;
    
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