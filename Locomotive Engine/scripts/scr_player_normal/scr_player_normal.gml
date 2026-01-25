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
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    var idle = (sign_input_x == 0);
    
    movespeed = 8;
    
    if (sign_image_xscale != sign_input_x)
    {
        hsp = 0;
        if (sign_input_x != 0)
            image_xscale = sign_input_x;
    }
    else
        hsp = approach(hsp, movespeed * InputX(INPUT_CLUSTER.NAVIGATION), 0.5);
    
    player_perform_jump(spr_jump);
    
    if (player_perform_taunt())
        return;
    
    if (player_perform_grabdash())
        return;
    
    if (player_perform_machrun())
        return;
    
    if (!grounded)
    {
        player_try_jumpstop();
        
        if (equals_to_either(sprite_index, [spr_jump, spr_grabdash_cancel]))
            animation_end(spr_fall);
        else if (sprite_index != spr_grabdash_bump)
            sprite_index = spr_fall;
        
        return;
    }
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1 || place_meeting(x, y - 32, obj_solid))
    {
        trace("Gob")
        state_machine_set_state(state_player_crouch());
        return;
    }
    
    if (equals_to_either(sprite_index, [spr_jump, spr_fall, spr_grabdash_cancel]))
        sprite_index_set(spr_land, 0);
    
    if (equals_to_either(sprite_index, [spr_land, spr_land_walk]))
    {
        sprite_index = (idle) ? spr_land : spr_land_walk;
        animation_end((idle) ? spr_idle : spr_walk);
        
        return;
    }
    
    if (sprite_index == spr_machslide_end && idle)
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