/// @ignore
function state_player_grabdash_start()
{
    sprite_index = spr_grabdash_intro;
    image_index = 0;
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    grabdash_airborne = !grounded;
    
    if (movespeed < 10 || sign_input_x == -sign_image_xscale)
    {
        movespeed = max(movespeed, 10 * grounded);
        
        if (sign_input_x != 0)
            image_xscale = sign_input_x;
    }
}

/// @ignore
function state_player_grabdash_step()
{
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (movespeed < 10)
        movespeed += 0.5;
    
    hsp = movespeed * sign_image_xscale;
    
    if (player_perform_jump(spr_longjump_intro))
    {
        state_machine_set_state(state_player_mach());
        
        sprite_index = spr_longjump_intro;
        
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
    
    if (sprite_index == spr_grabdash_intro)
        animation_end(spr_grabdash);
    if (sprite_index == spr_grabdash && grounded)
        animation_end(spr_grabdash_end);
    
    if (grabdash_airborne && grounded && sprite_index == spr_grabdash)
    {
        sprite_index = spr_grabdash_end;
        image_index = 0;
    }
    
    if (sign_input_x == -sign_image_xscale || (sprite_index == spr_grabdash_end && animation_end()))
    {
        state_machine_set_state(state_player_normal());
        
        if (sign_input_x == -sign_image_xscale && !grounded)
            sprite_index = spr_grabdash_cancel;
        
        return;
    }
}

/// @description This function will return an array containing the grabdash states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_grabdash()
{
    return [state_player_grabdash_start, state_player_grabdash_step, -1];
}