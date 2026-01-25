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
    sprite_index = (movespeed >= 12) ? spr_mach3 : spr_mach1;
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
    
    if (place_meeting(x + sign_image_xscale, y, obj_solid))
    {
        state_machine_set_state(state_player_animation());
        
        image_speed = 0.35;
        
        if (mach_stage >= 3)
        {
            sprite_index = spr_mach3hitwall;
            
            vsp = -6;
            movespeed = -6;
            grounded = false;
        }
        else
        {
            sprite_index = spr_wallsplat;
            
            vsp = 0;
            grav = 0;
        }
        
        return;
    }
    
    if (sign_input_x == -sign_image_xscale && movespeed >= 8 && grounded)
    {
        state_machine_set_state(state_player_machturn());
        return;
    }
    else if (sign_input_x == -sign_image_xscale && grounded)
        image_xscale *= -1;
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
    {
        state_machine_set_state(state_player_machroll());
        return;
    }
    
    if (!InputCheck(INPUT_VERB.MACHRUN) && grounded)
    {
        image_speed = 0.35;
        var state = (movespeed >= 8) ? state_player_machslide() : state_player_normal();
        
        state_machine_set_state(state);
        return;
    }
    
    if (InputPressed(INPUT_VERB.GRABDASH))
    {
        image_speed = 0.35;
        
        state_machine_set_state(state_player_grabdash());
        return;
    }
    
    if (grounded && InputPressed(INPUT_VERB.JUMP))
    {
        if (mach_stage <= 2)
        {
            sprite_index = spr_secondjump1;
            image_index = 0;
        }
        else if (mach_stage == 3)
        {
            sprite_index = spr_mach3jump;
            image_index = 0;
        }
        
        vsp = jump_height;
        grounded = false;
        
        return;
    }
    
    if (sprite_index == spr_mach4)
        image_speed = 0.75;
    else if (mach_stage > 2 || sprite_index == spr_rollgetup)
        image_speed = 0.4;
    else
        image_speed = movespeed / 15;
    
    if (!grounded)
    {
        if (InputReleased(INPUT_VERB.JUMP) && vsp < 0)
            vsp /= 20;
        
        if (sprite_index == spr_secondjump1)
            animation_end(spr_secondjump2);
        
        if (sprite_index == spr_mach3jump)
            animation_end(spr_mach3);
        
        if (sprite_index == spr_longjump)
            animation_end(spr_longjumpend);
        
        return;
    }

    if (sprite_index == spr_mach1 || sprite_index == spr_rollgetup)
        animation_end(spr_mach);
    
    if (sprite_index == spr_secondjump1 || sprite_index == spr_secondjump2 || sprite_index == spr_longjump || sprite_index == spr_longjumpend)
        sprite_index = spr_mach;
    
    if (sprite_index == spr_mach3jump || (sprite_index == spr_mach && mach_stage == 3))
        sprite_index = spr_mach3;
    
    if (mach_stage == 4)
        sprite_index = spr_mach4;
}

/// @description This function will return an array containing the mach states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_mach()
{
    return [state_player_mach_start, state_player_mach_step, -1];
}