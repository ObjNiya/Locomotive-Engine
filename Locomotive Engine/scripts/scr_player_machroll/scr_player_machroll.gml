/// @ignore
function state_player_machroll_start()
{
    sprite_index = spr_machroll;
    mask_index = spr_crouchmask;
}

/// @ignore
function state_player_machroll_step()
{
    hsp = movespeed * sign_image_xscale;
    
    if (!grounded)
    {
        sprite_index = spr_machroll_dive;
        
        vsp = 20;
    }
    else if (sprite_index == spr_machroll_dive)
        sprite_index = spr_machroll;
    
    if (player_perform_wallsplat())
        return;
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != 1 && !place_meeting(x, y - 32, [obj_solid, obj_slope]) && grounded)
    {
        state_machine_set_state(state_player_mach());
        
        sprite_index = spr_machroll_getup;
        image_index = 0;
        
        return;
    }
    
    image_speed = movespeed / 5.5;
}

/// @ignore
function state_player_machroll_end()
{
    mask_index = spr_player_mask;
    image_speed = 1;
}

/// @description This function will return an array containing the machroll states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_machroll()
{
    return [state_player_machroll_start, state_player_machroll_step, state_player_machroll_end];
}