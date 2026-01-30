/// @ignore
function state_player_crouch_start()
{
    mask_index = spr_crouchmask;
    
    image_speed = 1;
    
    if (sign(hsp) == 0)
        sprite_index_set(spr_crouch_intro, 0);
    else
        sprite_index = spr_crawl;
}

/// @ignore
function state_player_crouch_step()
{
    movespeed = 4;
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    hsp = movespeed * dir;
    
    visual_xscale = side(dir, visual_xscale);
    
    if (player_check_nothing_above() && player_check_can_jump())
    {
        player_setup_crouch_jump();
        return;
    }
    
    if (grounded)
    {
        if (player_check_can_get_up())
        {
            state_machine_set_state(state_player_normal());
            return;
        }
        
        if (sprite_index == spr_crouch_intro)
        {
            animation_end(spr_crouch);
            return;
        }
        
        sprite_index = (dir == 0) ? spr_crouch : spr_crawl;
        return;
    }
    
    if (!equals_to_either(sprite_index, [spr_crouch_jump, spr_crouch_fall]) || (sprite_index == spr_crouch_jump && animation_end()))
        sprite_index = spr_crouch_fall;
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