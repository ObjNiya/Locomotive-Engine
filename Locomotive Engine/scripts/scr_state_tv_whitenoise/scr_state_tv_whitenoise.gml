/// @ignore
function StateTvWhitenoiseStart()
{
    whitenoise.set_sprite(playerId.spr_tv_whitenoise);
    
    with (whitenoise)
    {
        image_index = 0;
        image_speed = 1;
        image_alpha = 1;
    }
}

/// @ignore
function StateTvWhitenoiseStep()
{
    with (whitenoise)
    {
        if (!animation_end())
            return;
    }
    
    smc_set_state(whitenoiseNextState);
    sprite_index = whitenoiseNextSprite;
}

/// @ignore
function StateTvWhitenoiseEnd()
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
function StateTvWhitenoise()
{
    return [StateTvWhitenoiseStart, StateTvWhitenoiseStep, StateTvWhitenoiseEnd];
}