/// @ignore
function StatePlayerSjumpPrepCreate()
{
    sprite_set(spr_sjump_prepare_intro, 0);
    image_xscale = abs(image_xscale);
    
    mask_index = spr_crouchmask;
    
    sound_instance_start(snd_superjump);
    sound_instance_set_parameter_by_name(snd_superjump, "State", 0);
}

/// @ignore
function StatePlayerSjumpPrepStep()
{
    if (sprite_index == spr_sjump_prepare_intro && !animation_end())
    {
        movespeed = approach(movespeed, 0, 1);
        hsp = movespeed * sign(hsp);
        
        return;
    }
    
    if (PlayerSjumpRelease())
    {
        SmcSetState("Sjump");
        return;
    }
    
    movespeed = 2;
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    hsp = movespeed * dir;
    
    sprite_index = (hsp == 0) ? spr_sjump_prepare_idle : spr_sjump_prepare_move;
}

/// @ignore
function StatePlayerSjumpPrepDestroy()
{
    mask_index = spr_player_mask;
}