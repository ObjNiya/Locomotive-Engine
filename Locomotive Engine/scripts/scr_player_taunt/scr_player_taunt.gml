/// @ignore
function state_player_taunt_start()
{
    stored_sprite_index = sprite_index;
    stored_image_index = image_index;
    
    quick_log(stored_sprite_index)
    
    stored_vsp = vsp;
    stored_hsp = hsp;
    stored_movespeed = movespeed;
    
    smc_store_state();
    
    grav = 0;
    vsp = 0;
    hsp = 0;
    movespeed = 0;
    
    sprite_set(spr_taunt, irandom(sprite_get_number(spr_taunt)));
    create_particle(x, y + 45, obj_taunt_particle);
    
    taunt_timer.Start();
    sound_instance_one_shot(sfx_player_taunt, x, y);
}

/// @ignore
function state_player_taunt_step()
{

}

/// @ignore
function state_player_taunt_end()
{
    grav = 0.5;
    
    sprite_index = stored_sprite_index;
    image_index = stored_image_index;
    
    vsp = stored_vsp;
    hsp = stored_hsp;
    movespeed = stored_movespeed;
}

/**
 * This function will return an array of the player's taunt state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_taunt()
{
    return [state_player_taunt_start, state_player_taunt_step, state_player_taunt_end];
}
