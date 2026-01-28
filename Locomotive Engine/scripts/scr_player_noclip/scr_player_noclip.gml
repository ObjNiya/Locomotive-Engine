/// @ignore
function state_player_noclip_start()
{
    sprite_index = spr_parry_intro;
    image_index = 1;
    image_speed = 0;
    
    movespeed = 0;
    hsp = 0;
    vsp = 0;
    grav = 0;
    
    usesCollision = false;
}

/// @ignore
function state_player_noclip_step()
{
    scare_enemy();
    hurt_enemy();
    
    var speed_multiplier = (InputCheck(INPUT_VERB.MACHRUN)) ? 16 : 8;
    
    var _hsp = InputX(INPUT_CLUSTER.NAVIGATION) * speed_multiplier;
    var _vsp = InputY(INPUT_CLUSTER.NAVIGATION) * speed_multiplier;
    
    x += _hsp;
    y += _vsp;
    
    if (InputPressed(INPUT_VERB.JUMP))
        state_machine_set_state(state_player_normal());
}

/// @ignore
function state_player_noclip_end()
{
    image_speed = 1;
    
    grav = 0.5;
    usesCollision = true;
}

/**
 * This function will return an array of the player's noclip events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_noclip()
{
    return [state_player_noclip_start, state_player_noclip_step, state_player_noclip_end];
}