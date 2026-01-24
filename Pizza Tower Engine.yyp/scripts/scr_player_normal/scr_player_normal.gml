/// @ignore
function state_player_normal_start()
{
    if (!grounded)
        sprite_index = spr_fall;
    else if (InputX(INPUT_CLUSTER.NAVIGATION) != 0)
        sprite_index = spr_walk;
}

/// @ignore
function state_player_normal_step()
{
    var input_x = InputX(INPUT_CLUSTER.NAVIGATION);
    var sign_input_x = sign(input_x);
    var idle = (input_x == 0);
    
    if (sign_image_xscale != sign_input_x)
    {
        movespeed = 0;
        if (sign_input_x != 0)
            image_xscale = sign_input_x;
    }
    else
        movespeed = approach(movespeed, 8 * (!idle), 0.5);
        
    hsp = movespeed * sign_image_xscale;
    
    if (sprite_index != spr_grabdashbump)
        grabdash_bump_buffer = 0;
    
    grabdash_bump_buffer--;
    
    if (InputPressed(INPUT_VERB.GRABDASH) && grabdash_bump_buffer <= 0)
    {
        state_machine_set_state(state_player_grabdash());
        return;
    }
    
    if (!grounded)
    {
        if (InputReleased(INPUT_VERB.JUMP) && vsp < 0)
            vsp /= 20;
        
        if (sprite_index == spr_jump || sprite_index == spr_grabdashfall || sprite_index == spr_grabdashcancel)
            animation_end(spr_fall);
        
        return;
    }
    
    if (InputCheck(INPUT_VERB.MACHRUN))
    {
        state_machine_set_state(state_player_mach());
        return;
    }
    
    if (InputPressed(INPUT_VERB.JUMP))
    {
        vsp = jump_height;
        
        sprite_index = spr_jump;
        image_index = 0;
        
        return;
    }
    
    if (sprite_index == spr_fall || sprite_index == spr_jump)
    {
        sprite_index = spr_land;
        image_index = 0;
    }
    
    if (sprite_index == spr_land || sprite_index == spr_landwalk)
    {
        sprite_index = (idle) ? spr_land : spr_landwalk;
        animation_end((idle) ? spr_idle : spr_walk);
        
        return;
    }
    
    if (sprite_index == spr_machslideend && idle)
    {
        animation_end(spr_idle);
        return;
    }
    
    if (idle)
    {
        sprite_index = spr_idle;
    }
    else
    {
        sprite_index = spr_walk;
    }
}

/// @description This function will return an array containing the normal states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_normal()
{
    return [state_player_normal_start, state_player_normal_step, -1];
}