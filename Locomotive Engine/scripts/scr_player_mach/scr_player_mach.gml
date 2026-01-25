/// @description This function will return at what mach stage the player is at (e.x movespeed 12 = 3, movespeed 16 = 4).
/// @returns {Real}
/// @pure
function player_get_mach_stage()
{
    var floor_movespeed = floor(movespeed);
    
    if (sprite_index == spr_mach1)
        return 1;
    else if (floor_movespeed < 12)
        return 2;
    else if (floor_movespeed < 16)
        return 3;
    else
        return 4;
}

/// @ignore
function state_player_mach_start()
{
    sprite_index = (player_get_mach_stage() >= 3) ? spr_mach3 : spr_mach1;
    image_index = 0;
    
    movespeed = max(movespeed, 6);
}

/// @ignore
function state_player_mach_step()
{
    var mach_accelerations = [0.1, 0.1, 0.025, 0.1];
    
    var mach_stage = player_get_mach_stage();
    var acceleration = mach_accelerations[mach_stage - 1] * grounded;
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    movespeed += acceleration * (sign_input_x == sign_image_xscale || mach_stage <= 2);
    hsp = movespeed * sign_image_xscale;
    
    if (player_perform_taunt())
        return;
    
    if (mach_stage >= 3 && place_meeting(x + sign_image_xscale, y, obj_solid))
    {
        state_machine_set_state(state_player_animation());
        
        sprite_index = spr_mach3_hit_wall;
            
        vsp = -6;
        movespeed = -6;
        grounded = false;
        
        return;
    }    
    
    if (player_perform_wallsplat())
        return;

    if (!InputCheck(INPUT_VERB.MACHRUN) && grounded)
    {
        var state = (movespeed >= 8) ? state_player_machslide() : state_player_normal();
        
        state_machine_set_state(state);
        return;
    }
    
    if (sign_input_x == -sign_image_xscale && movespeed >= 8 && grounded)
    {
        state_machine_set_state(state_player_machturn());
        return;
    }
    else if (sign_input_x == -sign_image_xscale && grounded)
        image_xscale *= -1;
    
    player_perform_jump((mach_stage <= 2) ? spr_mach2_jump_intro : spr_mach3_jump);
    
    if (player_perform_grabdash())
        return;
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
    {
        state_machine_set_state(state_player_machroll());
        return;
    }
    
    if (mach_stage <= 2 && sprite_index != spr_machroll_getup && sprite_index != spr_mach4)
        image_speed = (movespeed / 5.5);
    else
        image_speed = 1;
    
    if (mach_stage == 4)
        sprite_index = spr_mach4;
    
    if (!grounded)
    {
        player_try_jumpstop();
        
        if (sprite_index == spr_mach2_jump_intro)
            animation_end(spr_mach2_jump);
        
        if (sprite_index == spr_mach3_jump)
            animation_end(spr_mach3);
        
        if (sprite_index == spr_longjump_intro)
            animation_end(spr_longjump);
        
        return;
    }
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == -1 && mach_stage > 2)
    {
        state_machine_set_state(state_player_sjump_prepare());
        return;
    }

    if (sprite_index == spr_mach1 || sprite_index == spr_machroll_getup)
        animation_end(spr_mach2);
    
    if (sprite_index == spr_mach2_jump_intro || sprite_index == spr_mach2_jump || sprite_index == spr_longjump_intro || sprite_index == spr_longjump)
        sprite_index = spr_mach2;
    
    if (sprite_index == spr_mach3_jump || sprite_index == spr_sjump_cancel || (sprite_index == spr_mach2 && mach_stage == 3))
        sprite_index = spr_mach3;
}

/// @ignore
function state_player_mach_end()
{
    image_speed = 1;
}

/// @description This function will return an array containing the mach states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_mach()
{
    return [state_player_mach_start, state_player_mach_step, state_player_mach_end];
}