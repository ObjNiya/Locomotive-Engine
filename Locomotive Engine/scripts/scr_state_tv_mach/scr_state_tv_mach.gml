/// @ignore
function StateTvMachStart()
{ 
    
}

/// @ignore
function StateTvMachStep()
{
    var is_mach = (EqualsToAny(playerId.state_id, state_player_wallclimb, state_player_machturn) || (playerId.state_id == state_player_mach && playerId.movespeed >= 12));
    
    if (!is_mach)
        TvDoWhitenoise(id, StateTvIdle, playerId.spr_tv_idle);
    else if (playerId.state_id == state_player_machturn && sprite_index == playerId.spr_tv_mach4)
        TvDoWhitenoise(id, state_id, playerId.spr_tv_mach3);
    
    if (playerId.sprite_index == playerId.spr_mach4 && sprite_index != playerId.spr_tv_mach4)
        TvDoWhitenoise(id, state_id, playerId.spr_tv_mach4);
}

/// @ignore
function StateTvMachEnd()
{
    
}

/**
 * This function will return an array of the tv Mach state events to be given to the ```smc_set_state``` function to change the tv's state.
 * @returns {Array<Function>}
 * @pure
 */
function StateTvMach()
{
    return [StateTvMachStart, StateTvMachStep, StateTvMachEnd];
}