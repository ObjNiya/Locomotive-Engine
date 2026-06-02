/// @ignore
function StateEnemyGrabbedStart()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = stun_sprite;
    thrown_blur_afterimage_timer.Start();
}

/// @ignore
function StateEnemyGrabbedStep()
{
    grabbed_prefix();
    thrown_blur_afterimage_timer.step();
    grabbed_postfix();
}

/// @ignore
function StateEnemyGrabbedEnd()
{
    thrown_blur_afterimage_timer.Stop();
}

/**
 * This function will return an array of the enemies' grabbed state events to be given to the ```smc_set_state``` function to change the enemies' state.
 * @returns {Array<Function>}
 * @pure
 */
function StateEnemyGrabbed()
{
    return [StateEnemyGrabbedStart, StateEnemyGrabbedStep, StateEnemyGrabbedEnd];
}