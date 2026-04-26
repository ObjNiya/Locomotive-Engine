/// @ignore
function state_player_groundpound_start()
{
    sprite_set(spr_groundpound_intro, 0);
    
    accel = 0.25;
    deccel = 0.05;
    
    if (sign(InputX(INPUT_CLUSTER.NAVIGATION)) == 0)
        hsp = 0;
    vsp = -6;
    
    terminalVelocity = infinity;
    
    mach_afterimage_use_alpha = false;
    mach_afterimage_timer.max_time = 5;
    
    blur_afterimage_timer.start();
    sound_instance_start(snd_groundpound);
}

/// @ignore
function state_player_groundpound_step()
{
    var landed = equals_to_any(sprite_index, [spr_groundpound_land, spr_divebomb_land])
    
    if (grounded || landed)
    {
        if (grounded_slope)
        {
            smc_set_state(state_player_mach); 
            sprite_set(spr_machroll_getup, 0);
            
            if (groundpound_smash > 20)
                movespeed = 12;
            else
                movespeed = 8;
            
            dir = sign(-instance_place(x, y + 1, obj_slope).image_xscale);
            image_xscale = side(dir, image_xscale);
            
            create_particle(x, y + 45, obj_jump_particle);
            return;
        }
        
        if (!landed)
        {
            sprite_set((sprite_index == spr_divebomb) ? spr_divebomb_land : spr_groundpound_land, 0);
            image_speed = 1;
            
            hsp = 0;
            movespeed = 0;
            
            camera.shake_set(5, 0.25);
            
            mach_afterimage_use_alpha = true;
			
            mach_afterimage_timer.stop();
            mach_afterimage_timer.max_time = 6;
            
            blur_afterimage_timer.stop();
            downwards_woosh_particle_timer.stop();
            air_cloud_particle_timer.stop();
            
            create_particle(x, y + 45, obj_groundpound_slam_particle);
            instance_destroy(groundpound_effect_id);
            
            if (groundpound_smash >= 10)
            {
                while (place_meeting(x, y + 1, [obj_block_metal, obj_block_metal_tiles]))
                    instance_destroy(instance_place(x, y + 1, [obj_block_metal, obj_block_metal_tiles]));
            }
            
            sound_instance_stop(snd_groundpound, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
            sound_instance_one_shot(sfx_player_groundpound_land, x, y);
            
            return;
        }
        
        vsp = 0;
        
        if (animation_end())
        {
            smc_set_state(state_player_normal);
            sprite_set(spr_groundpound_idle_intro, 0);
        }
        
        return;
    }
    
    destroy_blocks(x, y + vsp, [obj_block_metal, obj_block_metal_tiles]);
    hurt_enemy();
    
    if (InputPressed(INPUT_VERB.GRABDASH))
    {
        smc_set_state(state_player_sjump);
        sprite_set(spr_sjump_cancel_prepare, 0);
        instance_destroy(obj_explosion_particle_alt);
        
        sound_instance_one_shot(sfx_player_sjump_cancel, x, y);
        
        vsp = 0;
        grav = 0;
        return;
    }

    groundpound_smash++;
    
    if (vsp < 0)
        groundpound_smash = -14;  
    
    if (groundpound_smash >= 10)
    {
        if (!instance_exists(groundpound_effect_id))
            groundpound_effect_id = create_particle(x, y, obj_groundpound_effect, false);
    }
    
    if (vsp >= 2)
    {
        grav = 1;
        
        air_cloud_particle_timer.start();
        
        if (vsp > 17)
        {
            mach_afterimage_timer.start();
            downwards_woosh_particle_timer.start();
        }
    }
    
    
    animation_end_ext((sprite_index == spr_groundpound_intro), spr_groundpound);
    
    if (sprite_index == spr_bananaslip_bump)
    {
        hsp = 0;
        
        return;
    }
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));

    hsp = movespeed * dir;
    
    if (movespeed > 7)
        movespeed -= deccel;
    else if (dir != 0)
        movespeed += accel;
    
    if (sign_input_x != dir || place_meeting_collision(x + hsp, y))
    {
        dir = sign_input_x;
        movespeed = 0;
    }        
    
    if (sprite_index != spr_divebomb)
        image_xscale = side(sign_input_x, image_xscale);
}

/// @ignore
function state_player_groundpound_end()
{
    grav = 0.5;
    terminalVelocity = 20;
    
    mach_afterimage_use_alpha = true;
    
    mach_afterimage_timer.stop();
    mach_afterimage_timer.max_time = 6;
    
    blur_afterimage_timer.stop();
    downwards_woosh_particle_timer.stop();
    air_cloud_particle_timer.stop();
    
    instance_destroy(groundpound_effect_id);
    
    sound_instance_stop(snd_groundpound, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
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