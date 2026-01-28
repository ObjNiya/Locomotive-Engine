/// @ignore
function state_player_grabdash_start()
{
    sprite_index_set(spr_grabdash_intro, 0);
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    grabdash_airborne = !grounded;
    
    if (movespeed < 10 || sign_input_x == -sign_image_xscale)
    {
        movespeed = max(movespeed, (grounded) ? 10 : 8);
        
        if (sign_input_x != 0)
            image_xscale = sign_input_x;
    }
    
    image_speed = 1;
    
    blur_afterimage_timer.start();
    with (instance_create(x, y + 45, obj_burst_cloud_particle))
        image_xscale = other.image_xscale;
}

/// @ignore
function state_player_grabdash_step()
{
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (movespeed < 10)
        movespeed += 0.5;
    
    hsp = movespeed * sign_image_xscale;
    
    if (player_perform_wallclimb(false, true))
        return;
    
    if (player_perform_jump(spr_longjump_intro))
    {
        state_machine_set_state(state_player_mach());
        
        sprite_index = spr_longjump_intro;
        
        return;
    }
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
    {
        state_machine_set_state(state_player_backslide());
        return;
    }
    
    if (place_meeting(x + sign_image_xscale, y, obj_solid))
    {
        state_machine_set_state(state_player_normal());
        
        vsp = -4;
        grounded = false;
        grabdash_bump_buffer = 60;
        
        sprite_index = spr_grabdash_bump;
        
        return;
    }
    
    if (instance_exists(grab_enemy()))
        return;
    
    animation_end_ext((sprite_index == spr_grabdash_intro), spr_grabdash);
    animation_end_ext((sprite_index == spr_grabdash && grounded), spr_grabdash_end);
    
    if (grabdash_airborne && grounded && sprite_index == spr_grabdash)
        sprite_index_set(spr_grabdash_end, 0);
    
    if (!instance_exists(grabdash_cloud_particle_id) && grounded && movespeed > 5)
    {
        with (instance_create(x, y + 45, obj_slide_cloud_particle))
        {
            other.grabdash_cloud_particle_id = id;
            image_xscale = other.image_xscale;
        }
    }
    
    if (sign_input_x == -sign_image_xscale || (sprite_index == spr_grabdash_end && animation_end()))
    {
        state_machine_set_state(state_player_normal());
        
        if (sign_input_x == -sign_image_xscale && !grounded)
            sprite_index = spr_grabdash_cancel;
        
        return;
    }
}

function state_player_grabdash_end()
{
    blur_afterimage_timer.stop();
}

/// @description This function will return an array containing the grabdash states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_grabdash()
{
    return [state_player_grabdash_start, state_player_grabdash_step, state_player_grabdash_end];
}