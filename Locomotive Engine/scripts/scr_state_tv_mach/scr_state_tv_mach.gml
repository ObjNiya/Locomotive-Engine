/// @ignore
function StateTvMachStep()
{
    var is_mach = (EqualsToAny(playerId.stateName, "Wallclimb", "Machturn") || (playerId.stateName == "Mach" && playerId.movespeed >= 12));
    
    if (!is_mach)
        TvDoWhitenoise(id, "Idle", playerId.spr_tv_idle);
    else if (playerId.stateName == "Machturn" && sprite_index == playerId.spr_tv_mach4)
        TvDoWhitenoise(id, stateName, playerId.spr_tv_mach3);
    
    if (playerId.sprite_index == playerId.spr_mach4 && sprite_index != playerId.spr_tv_mach4)
        TvDoWhitenoise(id, stateName, playerId.spr_tv_mach4);
}