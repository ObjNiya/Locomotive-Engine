/// @ignore
function StateTvWhitenoiseCreate()
{
    whitenoise.SetSprite(playerId.spr_tv_whitenoise);
    
    with (whitenoise)
    {
        imageIndex = 0;
        imageSpeed = 1;
        imageAlpha = 1;
    }
}

/// @ignore
function StateTvWhitenoiseStep()
{
    with (whitenoise)
    {
        if (!AnimationEnded())
            return;
    }
    
    sprite_index = whitenoiseNextSprite;
    SmcSetState(whitenoiseNextState);
}

/// @ignore
function StateTvWhitenoiseDestroy()
{
    with (whitenoise)
    {
        imageSpeed = 0;
        imageAlpha = 0;
    }
}