/// @ignore
function state_player_bananaslip_start()
{
    
}

/// @ignore
function state_player_bananaslip_step()
{
    
}

/// @ignore
function state_player_bananaslip_end()
{
    
}

/**
 * This function will return an array of the player bananaslip state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_bananaslip()
{
    return [state_player_bananaslip_start, state_player_bananaslip_step, state_player_bananaslip_end];
}