/// @ignore
function StatePlayerAnimCreate()
{
    
    
    image_index = 0;
    image_speed = 1;
}

/// @ignore
function StatePlayerAnimStep()
{
    if (grounded)
        movespeed = 0;
    
    hsp = movespeed * dir;
    
    image_xscale = Side(image_xscale, dir);
    
    if (AnimationEnd())
        SmcSetState("Normal");
}

/// @ignore
function StatePlayerAnimDestroy()
{
    grav = 0.5;
}