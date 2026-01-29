/// @ignore
function state_enemy_scared_scared_start()
{
    sprite_index = scared_sprite;
    
    hsp = 0;
    
    if (grounded)
        vsp = -3;
    else
        vsp = 0;
    
    scared_timer.start();
}

/// @ignore
function state_enemy_scared_scared_step()
{
    scared_timer.step();
}

/// @ignore
function state_enemy_scared_scared_end()
{
    scared_timer.stop();
}

/**
 * This function will return an array of the enemies' scared state events to be given to the ```state_machine_set_state``` function to change the enemies' state.
 * @returns {Array<Function>}
 * @pure
 */
function state_enemy_scared()
{
    return [state_enemy_scared_scared_start, state_enemy_scared_scared_step, state_enemy_scared_scared_end];
}