/// @ignore
function state_enemy_stunned_start()
{
    
}

/// @ignore
function state_enemy_stunned_step()
{
    
}

/// @ignore
function state_enemy_stunned_end()
{
    
}

/**
 * This function will return an array of the enemies' stunned state events to be given to the ```state_machine_set_state``` function to change the enemies' state.
 * @returns {Array<Function>}
 * @pure
 */
function state_enemy_stunned()
{
    return [state_enemy_stunned_start, state_enemy_stunned_step, state_enemy_stunned_end];
}