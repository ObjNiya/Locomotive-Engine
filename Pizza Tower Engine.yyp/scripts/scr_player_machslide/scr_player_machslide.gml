/// @ignore
function state_player_machslide_start()
{
    sprite_index = spr_machslidestart;
    image_index = 0;
}

/// @ignore
function state_player_machslide_step()
{
    movespeed = approach(movespeed, 0, 0.4);
    hsp = movespeed * sign(image_xscale);
    
    if (place_meeting(x + sign_image_xscale, y, obj_solid))
    {
        state_machine_set_state(state_player_animation());
        
        sprite_index = spr_wallsplat;
        
        grav = 0;
        vsp = 0;
        
        return;
    }
    
    if (movespeed <= 0)
    {
        sprite_index = spr_machslideend;
        image_index = 0;
        
        state_machine_set_state(state_player_normal());
        return;
    }
    
    if (sprite_index == spr_machslidestart)
        animation_end(spr_machslide);
}

/// @description This function will return an array containing the machslide states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_machslide()
{
    return [state_player_machslide_start, state_player_machslide_step, -1];
}