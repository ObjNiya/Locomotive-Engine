/// @ignore
function state_player_groundpound_start()
{
    sprite_index_set(spr_groundpound_intro, 0);
    
    acceleration = 0.5;
    
    if (sign(InputX(INPUT_CLUSTER.NAVIGATION)) == 0)
        hsp = 0;
    
    vsp = -6;
    terminalVelocity = 200;
    
    mach_afterimage_use_alpha = false;
    blur_afterimage_timer.start();
    
    sound_instance_start(snd_groundpound);
    
    attacking = true;
    strength = 2;
}

/// @ignore
function state_player_groundpound_step()
{
    if (grounded)
    {
        attacking = false;
        strength = 1;
        
        if (groundedSlope)
        {
            smc_set_state(state_player_mach); 
            sprite_index_set(spr_machroll_getup, 0);
            
            movespeed = abs(vsp);
            movespeed = clamp(movespeed, 10, 16);
            
            dir = sign(-instance_place(x, y + 1, [obj_slope, obj_slopePlatform]).image_xscale);
            image_xscale = dir;
            
            create_particle(x, y + 45, obj_jump_particle);
            return;
        }
        
        if (!equals_to_either(sprite_index, [spr_groundpound_land, spr_divebomb_land]))
        {
            sprite_index_set((sprite_index == spr_divebomb) ? spr_divebomb_land : spr_groundpound_land, 0);
            image_speed = 1;
            
            hsp = 0;
            movespeed = 0;
            
            create_particle(x, y + 45, obj_groundpound_slam_particle);
            
            sound_instance_stop(snd_groundpound, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
            sound_instance_one_shot(sfx_player_groundpound_land, x, y);
            
            return;
        }
        
        instance_destroy(groundpound_effect_id);
        
        if (animation_end())
            smc_set_state(state_player_normal);
        
        return;
    }
    
    if (InputPressed(INPUT_VERB.GRABDASH))
    {
        smc_set_state(state_player_sjump);
        sprite_index_set(spr_sjump_cancel_prepare, 0);
        instance_destroy(obj_explosion_particle_alt);
        
        sound_instance_one_shot(sfx_player_sjump_cancel, x, y);
        
        vsp = 0;
        grav = 0;
        return;
    }
    
    if (vsp >= 2)
    {
        grav = 1;
        
        cloud_particle_timer.start();
        
        if (vsp > 17)
        {
            mach_afterimage_timer.start();
            downwards_woosh_particle_timer.start();
            
            if (!instance_exists(groundpound_effect_id))
                groundpound_effect_id = create_particle(x, y, obj_groundpound_effect, false);
        }
    }
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    acceleration = abs(hsp) > 8 ? 0.05 : 0.25;
    
    if (dir != sign_input_x)
    {
        hsp = 0;
        dir = sign_input_x;
    }
    else
        hsp = approach(hsp, movespeed * dir, acceleration);
    
    if (sprite_index == spr_divebomb)
        image_xscale = 1;
    else if (dir != 0)
        image_xscale = dir;
    
    if (sprite_index == spr_divebomb && vsp >= 8)
        image_speed = clamp(image_speed, vsp / 8, 8);
    
    animation_end_ext((sprite_index == spr_groundpound_intro), spr_groundpound);
}

/// @ignore
function state_player_groundpound_end()
{
    grav = 0.5;
    terminalVelocity = 20;
    
    mach_afterimage_use_alpha = true;
    
    mach_afterimage_timer.stop();
    blur_afterimage_timer.stop();
    
    downwards_woosh_particle_timer.stop();
    cloud_particle_timer.stop();
    
    instance_destroy(groundpound_effect_id);
    
    sound_instance_stop(snd_groundpound, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
    
    attacking = false;
    strength = 1;
}

/**
 * This function will return an array of the player's groundpound state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_groundpound()
{
    return [state_player_groundpound_start, state_player_groundpound_step, state_player_groundpound_end];
}