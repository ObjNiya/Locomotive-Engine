/// @description This function will make the current player instance jump if the jump bind is pressed and they're on the ground or if the coyote timer is above 0.
/// @parameter {Asset.GMSprite} jump_sprite The sprite to set when jumping.
/// @parameter {Bool} forced Whether to ignore the check that checks if the player can jump and pressed the jump bind.
/// @returns {Bool}
function player_perform_jump(jump_sprite, forced = false)
{
    if ((!can_jump || !InputPressed(INPUT_VERB.JUMP)) && !forced)
        return false;
    
    vsp = jump_height;
    grounded = false;
    
    coyote_time = 0;
    can_jump = false;
    
    sprite_index = jump_sprite;
    image_index = 0;
    
    return true;
}

/// @description This function will make the current player instance grabdash if the grabdash bind is pressed and the grabdash bump buffer is 0.
/// @parameter {Bool} forced Whether to ignore the check that checks if the grabdash button is pressed and the grabdash bump buffer is 0.
/// @returns {Bool}
function player_perform_grabdash(forced = false)
{
    grabdash_bump_buffer = max(grabdash_bump_buffer--, 0);
    
    if (sprite_index != spr_grabdash_bump)
        grabdash_bump_buffer = 0;
    
    if ((!InputPressed(INPUT_VERB.GRABDASH) || grabdash_bump_buffer > 0) && !forced)
        return false;
    
    state_machine_set_state(state_player_grabdash());
    
    return true;
}

function player_perform_taunt(forced = false)
{
    if (!InputPressed(INPUT_VERB.TAUNT) && !forced)
        return false;
    
    state_machine_store_state();
    state_machine_set_state(state_player_taunt());
    
    return true;
}

/// @description This function will make the current player instance machrun if the machrun bind is held and they're not facing a wall.
/// @parameter {Bool} forced Whether to ignore the check that checks if the mach run button is held, the player isn't facing a wall and that the player isn't in the air.
/// @returns {Bool}
function player_perform_machrun(forced = false)
{
    if ((!InputCheck(INPUT_VERB.MACHRUN) || place_meeting(x + sign_image_xscale, y, obj_solid) || !grounded) && !forced)
        return false;
    
    state_machine_set_state(state_player_mach());
    return true;
}

function player_perform_wallclimb(forced = false, set_buffer = false)
{
    if (!place_meeting(x + sign_image_xscale, y, obj_solid) && !forced)
        return false;
    
    if (grounded && !groundedSlope && !forced)
        return false;
    
    wallclimb_grab_buffer = 10 * set_buffer;
    
    state_machine_set_state(state_player_wallclimb());
    return true;
}

/// @description This function will make the current player instance wallsplat if they're facing a wall.
/// @parameter {Bool} forced Whether to ignore the check that checks if player is facing the wall.
/// @returns {Bool}
function player_perform_wallsplat(forced = false)
{
    if (!place_meeting(x + sign_image_xscale, y, obj_solid) && !forced)
        return false;
    
    state_machine_set_state(state_player_animation());
    
    sprite_index = spr_wallsplat;
            
    vsp = 0;
    grav = 0;
    
    return true;
}

function player_perform_hit_ceiling(forced = false)
{
    if ((!place_meeting(x, y - 1, obj_solid) || grounded) && !forced)
        return false;
    
    state_machine_set_state(state_player_animation());
    
    sprite_index = spr_sjump_hit_ceiling;
            
    vsp = 0;
    grav = 0;
    
    return true;
}