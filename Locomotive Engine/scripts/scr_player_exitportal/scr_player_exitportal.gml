/// @ignore
function state_player_exitportal_start()
{
    grav = 0.2;
    vsp = -3;
    hsp = 0;
    
    movespeed = 0;
    vert_movespeed = 0;
    
    visual_xscale = 0;
    visual_yscale = 0;
    
    sprite_index = spr_bananaslip_bump;
    image_xscale = 1;
    
    blur_afterimage_timer.Start();
}

/// @ignore
function state_player_exitportal_step()
{
    if (grounded)
    {
        if (sprite_index != spr_bananaslip_land)
        {
            visual_xscale = 1;
            visual_yscale = 1;
            
            sprite_set(spr_bananaslip_land, 0);
            create_particle(x, y + 45, obj_bang_particle);
            sound_instance_one_shot(sfx_player_banana_slip_bump, x, y);
            blur_afterimage_timer.Stop();
        }
        else if (animation_end())
            smc_set_state(state_player_normal);
        
        return;
    }
    
    visual_xscale = approach(visual_xscale, 1, 0.04);
    visual_yscale = approach(visual_yscale, 1, 0.04);
    
    if (grav < 0.4)
        grav += 0.007;
}

/// @ignore
function state_player_exitportal_end()
{
    grav = 0.5;
}

/**
 * This function will return an array of the player exit portal state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_exitportal()
{
    return [state_player_exitportal_start, state_player_exitportal_step, state_player_exitportal_end];
}