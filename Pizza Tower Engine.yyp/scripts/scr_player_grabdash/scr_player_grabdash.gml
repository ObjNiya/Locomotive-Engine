/// @ignore
function state_player_grabdash_start()
{
    sprite_index = spr_grabdash;
    image_index = 0;
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    var sign_image_xscale = sign(image_xscale);
   
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
    
    if (place_meeting(x + sign_image_xscale, y, obj_solid))
    {
        state_machine_set_state(state_player_normal());
        
        vsp = -4;
        grounded = false;
        grabdash_bump_buffer = 60;
        
        sprite_index = spr_grabdashbump;
        
        return;
    }
    
    if (grounded && InputPressed(INPUT_VERB.JUMP))
    {
        state_machine_set_state(state_player_mach());
        
        sprite_index = spr_longjump;
        image_index = 0;
        
        vsp = jump_height;
        
        return;
    }
    
    if (sign_input_x != -sign_image_xscale && (!animation_end() || !grounded))
        return;
    
    if (InputCheck(INPUT_VERB.MACHRUN) && sign_input_x == sign_image_xscale && grounded)
    {
        state_machine_set_state(state_player_mach());
        return;
    }
    
    state_machine_set_state(state_player_normal());
    
    if (grounded)
        return;
    
    image_index = 0;
    
    if (sign_input_x == -sign_image_xscale)
        sprite_index = spr_grabdashcancel;
    else
        sprite_index = spr_grabdashfall;
}

/// @description This function will return an array containing the grabdash states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_grabdash()
{
    return [state_player_grabdash_start, state_player_grabdash_step, -1];
}