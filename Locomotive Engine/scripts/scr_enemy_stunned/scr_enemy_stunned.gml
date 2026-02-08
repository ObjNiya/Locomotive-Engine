/// @ignore
function state_enemy_stunned_start()
{
    visual_xscale = 1.3;
    visual_yscale = 0.8;
    
    sprite_index = spr_stunned;
    
    sound_instance_start(snd_stunned);
}

/// @ignore
function state_enemy_stunned_step()
{
    visual_xscale = approach(visual_xscale, 1, 0.03);
    visual_yscale = approach(visual_yscale, 1, 0.03);
    
    unstunnable_buffer--;
    
    movespeed = approach(movespeed, 0, 0.3);
    hsp = movespeed * -visual_xscale;
}

/// @ignore
function state_enemy_stunned_end()
{
    sound_instance_stop(snd_stunned, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
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