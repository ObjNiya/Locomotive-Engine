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
            
            image_xscale = sign(-instance_place(x, y + 1, [obj_slope, obj_slopePlatform]).image_xscale);
            
            instance_create(x, y + 45, obj_jump_particle);
            return;
        }
        
        
        if (sprite_index != spr_groundpound_land && sprite_index != spr_divebomb_land)
        {
            sprite_index_set((sprite_index == spr_divebomb) ? spr_divebomb_land : spr_groundpound_land, 0);
            image_speed = 1;
            
            hsp = 0;
            movespeed = 0;
            
            instance_create(x, y + 45, obj_groundpound_slam_particle);
            return;
        }
        
        if (animation_end())
        {
            state_machine_set_state(state_player_normal());
        }
        
        return;
    }
    
    if (vsp >= 2)
    {
        grav = 1;
        
        if (!step_particle_timer.started)
            step_particle_timer.start();
        
        if (vsp > 17)
        {
            if (!mach_afterimage_timer.started)
                mach_afterimage_timer.start();
            
            if (!groundpound_woosh_particle_timer.started)
                groundpound_woosh_particle_timer.start();
            
            if (!instance_exists(obj_groundpound_effect))
            {
                with (instance_create(x, y, obj_groundpound_effect))
                    player_instance = other.id;
            }    
        }
    }
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (sign_image_xscale != sign_input_x)
    {
        hsp = 0;
        
        if (sign_input_x != 0)
            image_xscale = sign_input_x;
    }
    else
    {
        var acceleration = abs(hsp) > 8 ? 0.05 : 0.25;
        hsp = approach(hsp, movespeed * InputX(INPUT_CLUSTER.NAVIGATION), acceleration);
    }
    
    animation_end_ext((sprite_index == spr_groundpound_intro), spr_groundpound);
    
    if (sprite_index == spr_divebomb && vsp >= 8)
        image_speed = clamp(image_speed, vsp / 8, 8);
}

function state_player_groundpound_end()
{
    grav = 0.5;
    terminalVelocity = 20;
    
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.stop();
    groundpound_woosh_particle_timer.stop();
    blur_afterimage_timer.stop();
}

function state_player_groundpound()
{
    return [state_player_groundpound_start, state_player_groundpound_step, state_player_groundpound_end];
}