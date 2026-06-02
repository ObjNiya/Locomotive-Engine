/// @ignore
function StatePlayerWarppipeCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    if (!EqualsToAny(sprite_index, spr_warppipe_down, spr_warppipe_up))
        sprite_set(spr_warppipe_down, 0);
    
    image_speed = 1;
    
    hsp = 0;
    vsp = 0;
    grav = 0;
    
    movespeed = 0;
    vert_movespeed = 0;
    
    warppipe_failsave_timer.Start();
}

/// @ignore
function StatePlayerWarppipeStep()
{
    if (animation_end() && image_speed != 0)
    {
        image_speed = 0;
        trans_room(obj_roomtrans_fade, -1);
    }
}

/// @ignore
function StatePlayerWarppipeDestroy()
{
    image_speed = 1;
    
    grav = 0.5;    
    warppipe_failsave_timer.Stop();
}

/// @ignore
function StatePlayerWarppipeRoomStart()
{
    SmcSetState((place_meeting(x, y + 32, obj_solid)) ? "Normal" : "Crouch");
}