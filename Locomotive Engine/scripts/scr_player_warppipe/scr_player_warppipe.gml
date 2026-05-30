/// @ignore
function state_player_warppipe_start()
{
    if (!equals_to_any(sprite_index, [spr_warppipe_down, spr_warppipe_up]))
        sprite_set(spr_warppipe_down, 0);
    
    image_speed = 1;
    
    hsp = 0;
    vsp = 0;
    grav = 0;
    
    movespeed = 0;
    vert_movespeed = 0;
    
    warppipe_failsave_timer.Start();
}

/// @ignore
function state_player_warppipe_step()
{
    if (animation_end() && image_speed != 0)
    {
        image_speed = 0;
        trans_room(obj_roomtrans_fade, -1);
    }
    
    if (room == get_target_room())
        smc_set_state((place_meeting(x, y + 32, obj_solid)) ? state_player_normal : state_player_crouch);
}

/// @ignore
function state_player_warppipe_end()
{
    image_speed = 1;
    
    grav = 0.5;    
    warppipe_failsave_timer.Stop();
}

/**
 * This function will return an array of the player warppipe state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_warppipe()
{
    return [state_player_warppipe_start, state_player_warppipe_step, state_player_warppipe_end];
}