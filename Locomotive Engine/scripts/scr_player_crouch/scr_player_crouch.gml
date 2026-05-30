/// @ignore
function state_player_crouch_start()
{
    mask_index = spr_crouchmask;
    image_speed = 1;
    
    if (sign(hsp) == 0)
        sprite_set(spr_crouch_intro, 0);
    else
        sprite_index = spr_crawl;
    
    movespeed = 4;
    accel = 4;
}

/// @ignore
function state_player_crouch_step()
{
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    hsp = movespeed * dir;
    
    image_xscale = side(dir, image_xscale);
    
    if (PLAYER_NOTHING_ABOVE && PLAYER_JUMP)
    {
        player_do_jump(false, spr_crouch_jump, -8);
        grounded = false;
    }
    
    if (player_do_ladder())
        return;
    
    if (!grounded)
    {
        if (!EqualsToAny(sprite_index, spr_crouch_jump, spr_crouch_fall) || (sprite_index == spr_crouch_jump && animation_end()))
            sprite_index = spr_crouch_fall;
        return;    
    }
    
    if (PLAYER_GET_UP)
    {
        smc_set_state(state_player_normal);
        return;
    }
    
    if ((dir == 0 && sprite_index != spr_crouch_intro) || (dir == 0 && sprite_index == spr_crouch_intro && animation_end()))
        sprite_index = spr_crouch;
    else
    	sprite_index = spr_crawl;
}

/// @ignore
function state_player_crouch_end()
{
    mask_index = spr_player_mask;
}

/**
 * This function will return an array of the player's crouch state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_crouch()
{
    return [state_player_crouch_start, state_player_crouch_step, state_player_crouch_end];
}