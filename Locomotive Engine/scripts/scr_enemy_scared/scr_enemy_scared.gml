/// @ignore
function StateEnemyScaredStart()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = spr_scared;
    hsp = 0;
    
    if (grounded)
        vsp = -3;
    else
        vsp = 0;
    
    scared_timer.Start();
}

/// @ignore
function StateEnemyScaredStep()
{
    scared_prefix();
    scared_timer.Step();
    scared_postfix();
}

/// @ignore
function StateEnemyScaredEnd()
{
    scared_timer.Stop();
}

/**
 * This function will return an array of the enemies' scared state events to be given to the ```smc_set_state``` function to change the enemies' state.
 * @returns {Array<Function>}
 * @pure
 */
function StateEnemyScared()
{
    return [StateEnemyScaredStart, StateEnemyScaredStep, StateEnemyScaredEnd];
}