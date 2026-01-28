/// @ignore
function state_player_crouch_start()
{
    if (sign(hsp) == 0)
        sprite_index_set(spr_crouch_intro, 0);
    else
        sprite_index = spr_crawl;
    
    mask_index = spr_crouchmask;
}

/// @ignore
function state_player_crouch_step()
{
    movespeed = 4;
    hsp = movespeed * InputX(INPUT_CLUSTER.NAVIGATION);
    
    var sign_hsp = sign(hsp);
    
    image_xscale = side(sign_hsp, image_xscale);
    
    if (!place_meeting(x, y - 32, obj_solid) && player_perform_jump(spr_crouch_jump))
        vsp += 3;
    
    if (!grounded)
    {
        if (sprite_index != spr_crouch_jump || (sprite_index == spr_crouch_jump && animation_end()))
            sprite_index = spr_crouch_fall;
        
        return;
    }
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != 1 && !place_meeting(x, y - 32, obj_solid))
    {
        state_machine_set_state(state_player_normal());
        return;
    }
    
    
    if (sprite_index == spr_crouch_intro && sign_hsp == 0)
    {
        animation_end(spr_crouch);
        return;
    }    
    
    sprite_index = (sign_hsp == 0) ? spr_crouch : spr_crawl;
}

/// @ignore
function state_player_crouch_end()
{
    mask_index = spr_player_mask;
}

/**
 * This function will return an array of the player's crouch state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_crouch()
{
    return [state_player_crouch_start, state_player_crouch_step, state_player_crouch_end];
}