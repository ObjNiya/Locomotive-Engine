/// @ignore
function StatePlayerWarppipeCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    if (!EqualsToAny(sprite_index, spr_warppipe_down, spr_warppipe_up))
        SpriteSet(spr_warppipe_down, 0);
    
    image_speed = 1;
    
    hsp = 0;
    vsp = 0;
    grav = 0;
    
    movespeed = 0;
    vertMovespeed = 0;
}

/// @ignore
function StatePlayerWarppipeStep()
{
    if (AnimationEnd() && image_speed != 0)
    {
        image_speed = 0;
        RoomTrans(obj_roomtrans_fade, -1);
    }
}

/// @ignore
function StatePlayerWarppipeDestroy()
{
    image_speed = 1;
    
    grav = 0.5;    
}

/// @ignore
function StatePlayerWarppipeRoomStart()
{
    SmcSetState((place_meeting(x, y + 32, obj_solid)) ? "Normal" : "Crouch");
}