#macro COYOTE_TIMER_MAX 8

/**
 * This function will initialize all the neccessary variables to run the coyote functions on the current instance.
 * The ```can_jump``` variable is to be read to identify whether or not the numeric value of the coyote timer exceeds 0.
 */
function coyote_initialize()
{
    coyote_time = COYOTE_TIMER_MAX;
    can_jump = true;
}

/**
 * This function will update the coyote timer and as such the ```can_jump``` variable on the current instance.
 */
function coyote_step()
{
    if (grounded)
    {
        coyote_time = COYOTE_TIMER_MAX;
        can_jump = true;
        
        return;
    }
    
    coyote_time = max(coyote_time - 1, 0);
    can_jump = (coyote_time > 0);
}

/**
 * This function is to be called once the current instance jumps, as it will snap the coyote timer to 0 to prevent instant re-jumping.
 */
function coyote_jump()
{
    coyote_time = 0;
    can_jump = false;
}