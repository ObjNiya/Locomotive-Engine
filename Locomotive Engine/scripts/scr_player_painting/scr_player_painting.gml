/// @ignore
function state_player_painting_start()
{
    sprite_index = spr_walk;
    
    hsp = 0;
    movespeed = 0;
    vert_movespeed = 0;
    accel = 0.5;
    
    camera.properties_set_locked(false, true, false);
}

/// @ignore
function state_player_painting_step()
{
    if (!instance_exists(painting_id))
    {
        smc_set_state(state_player_normal);
        return;
    }
    
    var target_dir = bsign(painting_id.x < x);
    var target_x = painting_id.x + (120 * target_dir);
    
    if (x != target_x && grounded)
    {
        cloud_particle_timer.start();
        
        movespeed = approach(movespeed, 6, accel);
        x = approach(x, target_x, movespeed);
        
        sprite_index = spr_walk;
        image_xscale = target_dir;
        
        var image_speed_curve = [1, 1.25, 1.5];
        
        var image_speed_curve_index = floor(movespeed / 3);
        image_speed_curve_index = clamp(image_speed_curve_index, 0, array_length(image_speed_curve) - 1);
        
        image_speed = image_speed_curve[image_speed_curve_index];
    }
    else if (grounded)
    {
        cloud_particle_timer.stop();
        sound_instance_one_shot(sfx_jump, x, y);
        
        vsp = -15;
        hsp = -2.5 * target_dir;
        movespeed = 0;
        
        sprite_set(spr_jump, 0);
        image_speed = 1;
        image_xscale = -target_dir;
    }
    else
    {
        animation_end(spr_fall);
        
        if (sign(vsp) == -1)
            exit;
        
        if (y > painting_id.ystart && visible)
        {
            visible = false;
            
            hsp = 0;
            vsp = 0;
            grav = 0;
            
            with (painting_id)
            {
                ripple_speed = 0.032;
                alarm[0] = 45;
            }

            sound_instance_one_shot(sfx_enter_painting);
        }
        else if (y + vsp > painting_id.ystart)
        {
            create_afterimage(x, y, obj_blur_afterimage);
            create_flash_effect(true);
        }
    }
}

/// @ignore
function state_player_painting_end()
{
    camera.properties_set_locked(false, false, false);
    
    visible = true;
}

/**
 * This function will return an array of the player Y state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_painting()
{
    return [state_player_painting_start, state_player_painting_step, state_player_painting_end];
}