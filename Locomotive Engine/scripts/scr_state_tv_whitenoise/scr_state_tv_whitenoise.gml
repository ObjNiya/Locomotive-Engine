/// @ignore
function StateTvWhitenoiseCreate()
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
        if (!AnimationEnd())
            return;
    }
    
    SmcSetState(whitenoiseNextState);
    sprite_index = whitenoiseNextSprite;
}

/// @ignore
function StateTvWhitenoiseDestroy()
{
    with (whitenoise)
    {
        image_index = 0;
        image_speed = 0;
        image_alpha = 0;
    }
}