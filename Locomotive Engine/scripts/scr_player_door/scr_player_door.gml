/// @ignore
function state_player_door_start()
{
    sprite_set(spr_lookdoor, 0);
    
    image_speed = 1;
    
    hsp = 0;
    vsp = 0;
    grav = 0;
    
    movespeed = 0;
    vert_movespeed = 0;
}

/// @ignore
function state_player_door_step()
{
    if (sprite_index == spr_walk_forward)
    {
        if (animation_end())
            smc_set_state(state_player_normal);
        
        return;
    }
    
    if (animation_end())
        image_speed = 0;
    
    static failsave_timer = 0;
    
    if (room == global.target_room || ++failsave_timer >= 300)
    {
        failsave_timer = 0;
        
        sprite_set(spr_walk_forward, 0);
        image_speed = 1;
    }
}

/// @ignore
function state_player_door_end()
{
    grav = 0.5;
    
    image_speed = 1;
}

/**
 * This function will return an array of the player door state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_door()
{
    return [state_player_door_start, state_player_door_step, state_player_door_end];
}