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

/// @description This function will return an array containing the noclip states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_noclip()
{
    return [state_player_noclip_start, state_player_noclip_step, state_player_noclip_end];
}