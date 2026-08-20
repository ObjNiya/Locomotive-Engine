/// @ignore
function StatePlayerDoorCreate()
{
    
    
    SpriteSet(spr_lookdoor, 0);
    
    image_speed = 1;
    
    hsp = 0;
    vsp = 0;
    grav = 0;
    
    movespeed = 0;
    vertMovespeed = 0;
    
    sound_instance_stop(sndSuperjump, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}

/// @ignore
function StatePlayerDoorStep()
{
    if (!AnimationEnd())
        return;
	
	if (image_speed != 0 && sprite_index == spr_keydoor)
		RoomTrans(obj_roomtrans_fade);
    
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
}

/// @ignore
function StatePlayerDoorRoomStart()
{
    SpriteSet(spr_walk_forward, 0);
    image_speed = 1;
}