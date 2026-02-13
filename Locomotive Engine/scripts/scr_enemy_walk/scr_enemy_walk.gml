/// @ignore
function state_enemy_walk_start()
{
    sprite_index = spr_walk;
    
    movespeed = 1;
}

/// @ignore
function state_enemy_walk_step()
{
    if (grounded && !place_meeting(x + image_xscale, y + 1, [obj_solid, obj_slope])) || (place_meeting(x + image_xscale, y, obj_solid))
        image_xscale *= -1;
 
    hsp = movespeed * image_xscale;
       
    if (!animation_end() || !grounded)
        return;
    
    instance_create(x, y + 43, obj_cloud_particle);
    image_index = 0;
}

/// @ignore
function state_enemy_walk_end()
{
    
}

/**
 * This function will return an array of the enemies' walk state events to be given to the ```smc_set_state``` function to change the enemies' state.
 * @returns {Array<Function>}
 * @pure
 */
function state_enemy_walk()
{
    return [state_enemy_walk_start, state_enemy_walk_step, state_enemy_walk_end];
}