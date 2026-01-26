/// @ignore
function state_player_backslide_start()
{
    vsp = (grounded) ? -3 : 3;
    movespeed = 12;
    
    sprite_index = spr_rolling_jump;
    mask_index = spr_crouchmask;
}

/// @ignore
function state_player_backslide_step()
{
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != 1 && !place_meeting(x, y - 32, [obj_solid, obj_slope]) && grounded)
    {
        state_machine_set_state(state_player_mach());
        sprite_index_set(spr_machroll_getup, 0);
        
        return;
    }
    
    if (place_meeting(x + sign_image_xscale, y, obj_solid))
    {
        image_xscale *= -1;
        sign_image_xscale = sign(image_xscale);
    }
    
    hsp = movespeed * sign_image_xscale;
    
    if (grounded && sprite_index == spr_rolling_jump)
        sprite_index_set(spr_backslide_land, 0);
    else if (!grounded)
        sprite_index = spr_rolling_jump;
    
    animation_end_ext((sprite_index == spr_backslide_land), spr_backslide);
}

/// @ignore
function state_player_backslide_end()
{
    mask_index = spr_player_mask;
}

function state_player_backslide()
{
    return [state_player_backslide_start, state_player_backslide_step, state_player_backslide_end];
}