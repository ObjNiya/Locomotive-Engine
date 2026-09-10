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
    {
        hsp = 0;
        maxSpd = 0;
    }
    
    image_xscale = Side(image_xscale, dir);
    
    if (AnimationEnd())
        SmcSetState("Normal");
}

/// @ignore
function StatePlayerAnimDestroy()
{
    grav = 0.5;
}