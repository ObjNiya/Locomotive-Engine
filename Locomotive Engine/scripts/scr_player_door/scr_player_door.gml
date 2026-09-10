/// @ignore
function StatePlayerDoorCreate()
{
    SpriteSet(spr_lookdoor, 0);
    
    image_speed = 1;
    
    hsp = 0;
    vsp = 0;
    grav = 0;
    
    acel = 0;
    maxSpd = 0;
    
    sound_instance_stop(sndSuperjump, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}


/// @ignore
function StatePlayerDoorRoomTrans()
{ 
    RoomTrans(obj_roomtrans_fade);
    image_speed = 0;
}


/// @ignore
function StatePlayerDoorStep()
{
    if (!AnimationEnd())
        return;
	
    switch (sprite_index)
    {
        case spr_lookdoor:
            if (place_meeting(x, y, obj_keydoor))
                SpriteSet(spr_keydoor, 0);
            else
                StatePlayerDoorRoomTrans();
            break;
        
        case spr_keydoor:
            StatePlayerDoorRoomTrans();
            break;
        
        case spr_walk_forward:
            SmcSetState("Normal");
            break;
    }
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