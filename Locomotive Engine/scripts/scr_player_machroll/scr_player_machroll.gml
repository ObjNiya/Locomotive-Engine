/// @ignore
function state_player_machroll_start()
{
    sprite_index = spr_machroll;
    mask_index = spr_crouchmask;
    
    with (instance_create(x, y + 45, obj_burst_cloud_particle))
        image_xscale = other.image_xscale;
    
    blur_afterimage_timer.start();
}

/// @ignore
function state_player_machroll_step()
{
    hsp = movespeed * sign_image_xscale;
    
    if (!grounded)
    {
        sprite_index = spr_machroll_dive;
        
        vsp = 20;
        
        if (InputPressed(INPUT_VERB.JUMP))
        {
            state_machine_set_state(state_player_groundpound());
            sprite_index_set(spr_divebomb, 0);
            
            return;
        }
    }
    else if (sprite_index == spr_machroll_dive)
        sprite_index = spr_machroll;
    
    if (player_perform_wallsplat())
        return;
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != 1 && !place_meeting(x, y - 32, [obj_solid, obj_slope]) && grounded)
    {
        state_machine_set_state(state_player_mach());
        sprite_index_set(spr_machroll_getup, 0);
        
        with (instance_create(x, y + 45, obj_burst_cloud_particle))
            image_xscale = other.image_xscale;
        
        return;
    }
    
    image_speed = movespeed / 5.5;
    
    if (instance_exists(mach_cloud_particle_id))
        return;
    
    with (instance_create(x, y + 45, obj_mach2_cloud_particle)) 
    {
        other.mach_cloud_particle_id = id;
        image_xscale = other.image_xscale;
    }
}

/// @ignore
function state_player_machroll_end()
{
    mask_index = spr_player_mask;
    image_speed = 1;
    
    blur_afterimage_timer.stop();
}

/**
 * This function will return an array of the player's machroll state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_machroll()
{
    return [state_player_machroll_start, state_player_machroll_step, state_player_machroll_end];
}