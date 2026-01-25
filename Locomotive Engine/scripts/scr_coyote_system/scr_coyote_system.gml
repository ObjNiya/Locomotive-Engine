/// @description This function will initialize variables on the current instance to run the coyote manager.
function coyote_manager_initialize()
{
    coyote_time_max = 8;
    coyote_time = coyote_time_max;
    
    can_jump = true;
}

/// @description This function will update the coyote timer and will tell whether or not the current instance should be able to jump within the ```can_jump``` variable (boolean).
function coyote_manager_step()
{
    coyote_time--;
    
    if (grounded)
        coyote_time = coyote_time_max;
    
    can_jump = (grounded || coyote_time > 0);
}