/// @ignore
function state_player_hurt_start()
{
    sprite_index = spr_hurt;
    
    movespeed = -6;
    vsp = -9;
    
    sound_instance_one_shot(sfx_player_hurt, x, y);
    create_afterimage(x, y, obj_flash_afterimage);
}

/// @ignore
function state_player_hurt_step()
{
    hsp = movespeed * dir;
    
    if (grounded)
    {
        state_machine_set_state(state_player_normal());
        return;
    }
}

/// @ignore
function state_player_hurt_end()
{
    
}

/**
 * This function will return an array of the player hurt state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_hurt()
{
    return [state_player_hurt_start, state_player_hurt_step, state_player_hurt_end];
}