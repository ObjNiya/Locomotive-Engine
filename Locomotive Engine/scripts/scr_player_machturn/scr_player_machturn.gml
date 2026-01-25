/// @ignore
function state_player_machturn_start()
{
    sprite_index = (player_get_mach_stage() > 2) ? spr_mach3turn : spr_mach2turn;
    image_index = 0;
    image_speed = 0.35;
}

/// @ignore
function state_player_machturn_step()
{
    movespeed = approach(movespeed, 0, 0.4);
    hsp = movespeed * sign(image_xscale);
    
    if (movespeed <= 0 && grounded)
    {
        var mach3 = (sprite_index == spr_mach3turn);
        
        image_index = 0;
        image_xscale *= -1;
        image_speed = 0.35;
        
        movespeed = (mach3) ? 12 : 10;
        
        state_machine_set_state(state_player_mach());
        
        sprite_index = (mach3) ? spr_mach3 : spr_mach;
        return;
    }
    else if (!grounded && animation_end())
        image_speed = 0;
}

/// @description This function will return an array containing the machturn states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_machturn()
{
    return [state_player_machturn_start, state_player_machturn_step, -1];
}