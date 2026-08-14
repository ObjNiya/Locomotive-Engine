/**
 * Specifies for how many frames Coyote Time is active when off the ground.
 */
#macro COYOTE_TIMER_MAX 8


/**
 * Creates all the neccessary variables on the current instance to run Coyote Time functions.
 * Use ```canJump``` to see if the Coyote Time has expired or not.
 */
function CoyoteTimeInit()
{
    coyoteTime = COYOTE_TIMER_MAX;
    canJump = true;
}


/**
 * Ticks down the Coyote Time if the current instance isn't grounded and updates the ```canJump``` variable.
 */
function CoyoteTimeStep()
{
    if (grounded)
    {
        coyoteTime = COYOTE_TIMER_MAX;
        canJump = true;
        
        return;
    }
    
    coyoteTime--;
    canJump = (coyoteTime > 0);
}


/**
 * Sets the Coyote Time to 0, meant to be called when the current instance jumps to prevent double jumping.
 */
function CoyoteTimeJump()
{
    coyoteTime = 0;
    canJump = false;
}