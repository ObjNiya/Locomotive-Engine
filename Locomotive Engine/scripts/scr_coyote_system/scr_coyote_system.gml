/**
 * This function will initialize the required values to run the coyote manager on the current object, which also requires collision to be initialized on the current object already.
 * ```can_jump``` should be the only variable important to you, as it dictates if the should be able to jump based on the coyote timer.
 * ```coyote_time_max``` is the value the coyote timer should reset to when the current object is on the ground, it's not recommended to change this 
 * as it has been fine tuned spefically for this game.
 * 
 */
function coyote_manager_initialize()
{
    coyote_time_max = 8;
    coyote_time = coyote_time_max;
    
    can_jump = true;
}

/**
 * This function will update the coyote manager to run it's timer and to update the ```can_jump``` variable.
 * As the suffix implies, this function should be ran in the step event of the object you initialized the coyote manager on.
 */
function coyote_manager_step()
{
    coyote_time--;
    
    if (grounded)
        coyote_time = coyote_time_max;
    
    can_jump = (grounded || coyote_time > 0);
}

function coyote_manager_jump()
{
    coyote_time = 0;
    can_jump = false;
}