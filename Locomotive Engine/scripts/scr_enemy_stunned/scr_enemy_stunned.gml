/// @ignore
function StateEnemyStunnedStart()
{
    ENEMY_STATE_FAILSAVE;
    
    visual_xscale = 1.3;
    visual_yscale = 0.8;
    
    sprite_index = spr_stunned;
    stunned_timer.Start();
}

/// @ignore
function StateEnemyStunnedStep()
{
    visual_xscale = approach(visual_xscale, 1, 0.03);
    visual_yscale = approach(visual_yscale, 1, 0.03);
    
    if (unstunableBuffer > 0)
        unstunableBuffer--;
    
    movespeed = approach(movespeed, 0, 0.3);
    hsp = movespeed * -image_xscale;
    
    if (movespeed > 4 && grounded)
        create_particle_repeating(x, y + 43, obj_machturn_particle);
}

/// @ignore
function StateEnemyStunnedEnd()
{
    stunned_timer.Stop();
}

/**
 * This function will return an array of the enemies' stunned state events to be given to the ```smc_set_state``` function to change the enemies' state.
 * @returns {Array<Function>}
 * @pure
 */
function StateEnemyStunned()
{
    return [StateEnemyStunnedStart, StateEnemyStunnedStep, StateEnemyStunnedEnd];
}