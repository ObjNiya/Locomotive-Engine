/// @ignore
function state_tv_whitenoise_start()
{
    with (whitenoise)
    {
        image_index = 0;
        image_speed = 1;
        image_alpha = 1;
    }
}

/// @ignore
function state_tv_whitenoise_step()
{
    with (whitenoise)
    {
        if (!animation_end())
            return;
    }
    
    smc_set_state(whitenoise_next_state);
}

/// @ignore
function state_tv_whitenoise_end()
{
    with (whitenoise)
    {
        image_index = 0;
        image_speed = 0;
        image_alpha = 0;
    }
}

/**
 * This function will return an array of the tvwhitenoise state events to be given to the ```smc_set_state``` function to change the tv's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_tv_whitenoise()
{
    return [state_tv_whitenoise_start, state_tv_whitenoise_step, state_tv_whitenoise_end];
}