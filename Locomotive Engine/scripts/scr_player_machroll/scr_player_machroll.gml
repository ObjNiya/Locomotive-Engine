/// @ignore
function state_player_machroll_start()
{
    sprite_index_set(spr_machroll, 0);
    mask_index = spr_crouchmask;
    
    with (instance_create(x, y + 45, obj_burst_cloud_particle))
        image_xscale = other.image_xscale;
    
    blur_afterimage_timer.start();
    sound_instance_start(snd_machroll);
    
    attacking = true;
}

/// @ignore
function state_player_machroll_step()
{
    hsp = movespeed * dir;
    strength = real(sprite_index == spr_backslide || sprite_index == spr_backslide_land);
    
    if (sprite_index == spr_rolling_jump)
    {
        if (grounded)
            sprite_index_set(spr_backslide_land, 0);
        else
            vsp += 0.5;
        
        return;
    }
    
    if (PLAYER_HIT_WALL)
    {
        player_setup_wallsplat();
        return;
    }
    
    if (grounded)
    {
        if (PLAYER_GET_UP)
        {
            smc_set_state(state_player_mach);
            sprite_index_set(spr_machroll_getup, 0);
            sound_instance_start(snd_roll_getup);
            
            return;
        }
        
        image_speed = 1;
        
        if ((movespeed < 12 || !animation_end()) && !equals_to_either(sprite_index, [spr_backslide_land, spr_backslide]))
        {
            sprite_index = spr_machroll;
            image_speed = movespeed / 5.5;
        }
        else if (sprite_index == spr_machroll)
            sprite_index_set(spr_backslide_land, 0);
        
        animation_end_ext((sprite_index == spr_backslide_land), spr_backslide);
        create_particle_repeating(x, y + 45, obj_mach2_cloud_particle);
        
        return;
    }
    
    vsp = 20;
    
    if (sprite_index != spr_machroll_dive)
    {
        sound_instance_start(snd_dive);
        sprite_index = spr_machroll_dive;
    }
    
    if (PLAYER_DIVEBOMB)
    {
        smc_set_state(state_player_groundpound);
        sprite_index_set(spr_divebomb, 0);
            
        return;
    }
}

/// @ignore
function state_player_machroll_end()
{
    mask_index = spr_player_mask;
    image_speed = 1;
    
    blur_afterimage_timer.stop();
    
    sound_instance_stop(snd_machroll, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
    
    attacking = false;
}

/**
 * This function will return an array of the player's machroll state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_machroll()
{
    return [state_player_machroll_start, state_player_machroll_step, state_player_machroll_end];
}