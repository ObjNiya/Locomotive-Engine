/// @ignore
function state_player_groundpound_start()
{
    sprite_index_set(spr_groundpound_intro, 0);
    
    if (sign(InputX(INPUT_CLUSTER.NAVIGATION)) == 0)
        hsp = 0;
    
    vsp = -6;
    terminalVelocity = 200;
    
    mach_afterimage_use_alpha = false;
    blur_afterimage_timer.start();
}

/// @ignore
function state_player_groundpound_step()
{
    if (grounded)
    {
        if (groundedSlope)
        {
            state_machine_set_state(state_player_mach()); 
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
            return;
        }
        
        if (animation_end())
            state_machine_set_state(state_player_normal());
        
        return;
    }
    
    hurt_enemy();
    
    if (vsp >= 2)
    {
        grav = 1;
        
        cloud_particle_timer.start();
        
        if (vsp > 17)
        {
            mach_afterimage_timer.start();
            downwards_woosh_particle_timer.start();
            
            create_particle_repeating(x, y, obj_groundpound_effect);
        }
    }
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    var acceleration = abs(hsp) > 8 ? 0.05 : 0.25;
    
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
}

/**
 * This function will return an array of the player's groundpound state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_groundpound()
{
    return [state_player_groundpound_start, state_player_groundpound_step, state_player_groundpound_end];
}