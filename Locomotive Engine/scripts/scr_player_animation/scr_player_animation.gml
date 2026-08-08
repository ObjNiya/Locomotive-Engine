/// @ignore
function StatePlayerAnimCreate()
{
    PLAYER_STATE_FAILSAVE;
    image_index = 0;
    image_speed = 1;
}

/// @ignore
function StatePlayerAnimStep()
{
    if (grounded)
        movespeed = 0;
    
    hsp = movespeed * dir;
    
    image_xscale = side(image_xscale, dir);
    
    if (animation_end())
        SmcSetState("Normal");
}

/// @ignore
function StatePlayerAnimDestroy()
{
    grav = 0.5;
}