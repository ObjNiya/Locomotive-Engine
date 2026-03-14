/// @ignore
function state_player_ladder_start()
{
    sprite_index = spr_ladder_up;
    image_speed = 0;
    
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    vert_movespeed = 6;
}

/// @ignore
function state_player_ladder_step()
{
    vert_dir = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    vsp = vert_movespeed * vert_dir;
    
    if (!place_meeting(x, y, ladder_id) || (grounded && vert_dir == 1 && !place_meeting(x, y, obj_platform)))
    {
        smc_set_state(state_player_normal);
        vsp = 0;
        
        return;
    }
    
    x = (ladder_id.x - ladder_id.sprite_xoffset) + (ladder_id.sprite_width / 2);
    image_speed = 1;
    
    if (vert_dir == 1)
    {
        sprite_index = spr_ladder_down;
        vsp = 10;
    }
    else
    {
        sprite_index = spr_ladder_up;
        
        if (vert_dir == 0)
        {
            image_speed = 0;
            image_index = 0;
        }
    }  
}

/// @ignore
function state_player_ladder_end()
{
    ladder_id = noone;
    image_speed = 1;
}

/**
 * This function will return an array of the player ladder state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_ladder()
{
    return [state_player_ladder_start, state_player_ladder_step, state_player_ladder_end];
}