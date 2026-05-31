/// @ignore
function state_enemy_walk_start()
{
    sprite_index = spr_walk;
    
    movespeed = 1;
    hurtbox.active = true;
}

/// @ignore
function state_enemy_walk_step()
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
function state_enemy_walk_end()
{
    hurtbox.active = false;
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