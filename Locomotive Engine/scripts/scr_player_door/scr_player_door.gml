/// @ignore
function StatePlayerDoorCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    sprite_set(spr_lookdoor, 0);
    
    image_speed = 1;
    
    hsp = 0;
    vsp = 0;
    grav = 0;
    
    movespeed = 0;
    vert_movespeed = 0;
    
    sound_instance_stop(snd_superjump, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
    
    warppipe_failsave_timer.Start();
}

/// @ignore
function StatePlayerDoorStep()
{
    if (!animation_end())
        return;
    
    if (sprite_index == spr_walk_forward)
        SmcSetState("Normal");
    else
        image_speed = 0;
}

/// @ignore
function StatePlayerDoorDestroy()
{
    image_speed = 1;
    
    grav = 0.5;
    warppipe_failsave_timer.Start();
}

/// @ignore
function StatePlayerDoorRoomStart()
{
    sprite_set(spr_walk_forward, 0);
    image_speed = 1;
}