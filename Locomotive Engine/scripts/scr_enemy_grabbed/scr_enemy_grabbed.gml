/// @ignore
function state_enemy_grabbed_start()
{
    sprite_index = stun_sprite;
    
    thrown_blur_afterimage_timer.Start();
}

/// @ignore
function state_enemy_grabbed_step()
{
    thrown_blur_afterimage_timer.step();
}

/// @ignore
function state_enemy_grabbed_end()
{
    thrown_blur_afterimage_timer.Stop();
}

/**
 * This function will return an array of the enemies' grabbed state events to be given to the ```smc_set_state``` function to change the enemies' state.
 * @returns {Array<Function>}
 * @pure
 */
function state_enemy_grabbed()
{
    return [state_enemy_grabbed_start, state_enemy_grabbed_step, state_enemy_grabbed_end];
}