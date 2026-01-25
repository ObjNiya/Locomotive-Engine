/// @ignore
function state_player_machslide_start()
{
    sprite_index = spr_machslide_intro;
    image_index = 0;
}

/// @ignore
function state_player_machslide_step()
{
    movespeed = approach(movespeed, 0, 0.4);
    hsp = movespeed * sign(image_xscale);
    
    if (movespeed <= 0)
    {
        sprite_index = spr_machslide_end;
        image_index = 0;
        
        state_machine_set_state(state_player_normal());
        return;
    }
    
    if (player_perform_wallsplat())
        return;
    
    if (sprite_index == spr_machslide_intro)
        animation_end(spr_machslide);
}

/// @description This function will return an array containing the machslide states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_machslide()
{
    return [state_player_machslide_start, state_player_machslide_step, -1];
}