/**
 * Should be called at the start of your instances' step event to pause code execution while hitstun is active.
 */
#macro HITSTUN_STEP if (HitstunStep()) exit

/**
 * Creates the neccessary variables on the current instance to apply hitstun.
 */
function HitstunInit()
{
    hitstunTimer = 0;
    hitstunShakeMag = 4;
    
    hitstunX = 0;
    hitstunY = 0;
    hitstunImageSpeed = 1;
}

/**
 * Sets the Hitstun Time and the Hitstun Shake Magnitude for the current instance.
 * @parameter {Real} duration The duration of the hitstun in frames.
 * @parameter {Real} shake_magnitude How many pixels far the current instance should shake while hitstun is active.
 */
function HitstunSet(duration = 5, shake_magnitude = 4)
{
    if (hitstunTimer <= 0)
    {
        hitstunX = x;
        hitstunY = y;
        hitstunImageSpeed = image_speed;
    }
    
    hitstunTimer = duration;
    hitstunShakeMag = shake_magnitude;
}

/**
 * Enables hitstun on the current instance if the Hitstun Time hasn't expired yet and counts the Hitstun Time down.
 */
function HitstunStep()
{
    var timer_prev = hitstunTimer;

    if (--hitstunTimer <= 0)
    {
        if (timer_prev > 0)
        {
            x = hitstunX;
            y = hitstunY;
            image_speed  = hitstunImageSpeed;
        }
        
        return false; 
    }
    
    image_speed = 1;
    
    var shake_x = M_RandomSign(4);
    var shake_y = M_RandomSign(4);
    
    image_speed = 0;
    x = hitstunX + shake_x;
    y = hitstunY + shake_y;
    
    return true;
}