/// @ignore
function StateEnemyWalkStart()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = spr_walk;
    movespeed = 1;
}

/// @ignore
function StateEnemyWalkStep()
{
    walk_prefix();
    
    var end_of_floor = !place_meeting_collision(x + sign(image_xscale) * 15, y + 31);
    var touch_wall = place_meeting_collision(x + image_xscale, y, Exclude.SLOPES);
    
    if ((end_of_floor && grounded) || touch_wall)
        image_xscale *= -1;
 
    hsp = movespeed * image_xscale;
    
    if (animation_end() && grounded)
    {
        instance_create(x, y + 43, obj_cloud_particle);
        image_index = 0;
    }
    
    walk_postfix();
}

/// @ignore
function StateEnemyWalkEnd()
{
    
}

/**
 * This function will return an array of the enemies' walk state events to be given to the ```smc_set_state``` function to change the enemies' state.
 * @returns {Array<Function>}
 * @pure
 */
function StateEnemyWalk()
{
    return [StateEnemyWalkStart, StateEnemyWalkStep, StateEnemyWalkEnd];
}