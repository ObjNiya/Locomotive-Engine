/// @ignore
function StateTvIdleStart()
{ 
    if (sprite_index != spr_tv_turnon_damian)
        sprite_index = playerId.spr_tv_idle;
    else
        sprite_index = playerId.spr_tv_turnon;
}

/// @ignore
function StateTvIdleStep()
{
    if (sprite_index == playerId.spr_tv_turnon)
    {
        animation_end(playerId.spr_tv_idle);
        return;
    }
    
    if (playerId.state_id == state_player_mach && playerId.movespeed >= 12)
    {
        if (playerId.sprite_index == playerId.spr_mach4)
            idleDoMach4Tv();
        else
            idleDoMach3Tv();
    }
    
    if (playerId.state_id == state_player_noclip)
    {
        sprite_index = playerId.spr_tv_noclip;
        return;
    }
    
    if (is_showtime())
    {
        sprite_index = (global.laps >= 2) ? playerId.spr_tv_lap2 : playerId.spr_tv_showtime;
        
        if (instance_exists(obj_secret_marker))
            sprite_index = playerId.spr_tv_showtimesecret;
        
        return;
    }

    if (instance_exists(obj_secret_marker))
        sprite_index = playerId.spr_tv_secret;
    else if (global.combo >= 50)
        sprite_index = playerId.spr_tv_heat;
    else if (global.combo >= 3)
        sprite_index = playerId.spr_tv_combo;
    else if (!equals_to_any(sprite_index, [playerId.spr_tv_idleanim1, playerId.spr_tv_idleanim2]))
    {
        sprite_index = playerId.spr_tv_idle;
        
        if (animation_end() && IdleAnimTimer-- <= 0)
        {
            sprite_index = choose(playerId.spr_tv_idleanim1, playerId.spr_tv_idleanim2);
            image_index = 0;
        }
    }
    else if (animation_end())
    {
        sprite_index = playerId.spr_tv_idle;
        IdleAnimTimer = 240 + (60 * irandom_range(-1, 2));
    }
}

/// @ignore
function StateTvIdleEnd()
{
    
}

/**
 * This function will return an array of the tv idle state events to be given to the ```smc_set_state``` function to change the tv's state.
 * @returns {Array<Function>}
 * @pure
 */
function StateTvIdle()
{
    return [StateTvIdleStart, StateTvIdleStep, StateTvIdleEnd];
}