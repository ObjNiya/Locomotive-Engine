/// @ignore
function state_player_sjump_prepare_start()
{
    sprite_index_set(spr_sjump_prepare_intro, 0);
    image_xscale = abs(image_xscale);
    
    mask_index = spr_crouchmask;
    
    sound_instance_start(snd_superjump);
    sound_instance_set_parameter_by_name(snd_superjump, "State", 0);
}

/// @ignore
function state_player_sjump_prepare_step()
{
    if (sprite_index == spr_sjump_prepare_intro && !animation_end())
    {
        movespeed = approach(movespeed, 0, 1);
        hsp = movespeed * sign(hsp);
        
        return;
    }
    
    if (player_check_sjump_prepare_release())
    {
        state_machine_set_state(state_player_sjump());
        return;
    }
    
    movespeed = 3;
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (grounded)
        hsp = movespeed * dir;
    else
        hsp = approach(hsp, movespeed * dir, 0.35);
    
    sprite_index = (hsp == 0) ? spr_sjump_prepare_idle : spr_sjump_prepare_move;
}

/// @ignore
function state_player_sjump_prepare_end()
{
    mask_index = spr_player_mask;
}

/**
 * This function will return an array of the player's superjump prepare state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_sjump_prepare()
{
    return [state_player_sjump_prepare_start, state_player_sjump_prepare_step, state_player_sjump_prepare_end];
}