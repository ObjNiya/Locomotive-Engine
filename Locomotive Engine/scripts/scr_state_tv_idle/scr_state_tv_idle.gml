/// @ignore
function StateTvIdleCreate()
{ 
    if (sprite_index != spr_tv_turnon_damian)
    {
        sprite_index = playerId.spr_tv_idle;
        
        if (playerId.stateName == "Mach" && playerId.movespeed >= 12)
        {
            sprite_index = (playerId.sprite_index == playerId.spr_mach4) ? playerId.spr_tv_mach4 : playerId.spr_tv_mach3;
            smc_set_state("Mach");
        }
    }
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
    
    if (playerId.stateName == "Mach" && playerId.movespeed >= 12)
        TvDoWhitenoise(id, "Mach", (playerId.sprite_index == playerId.spr_mach4) ? playerId.spr_tv_mach4 : playerId.spr_tv_mach3);
    
    if (playerId.stateName == "Noclip")
    {
        sprite_index = playerId.spr_tv_noclip;
        return;
    }
    
    if (IsShowtime())
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
    else if (!EqualsToAny(sprite_index, playerId.spr_tv_idleanim1, playerId.spr_tv_idleanim2))
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