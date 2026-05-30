function TvDoWhitenoise(tv_id, next_state, next_sprite)
{
    with (tv_id)
    {
        whitenoiseNextState = next_state;
        whitenoiseNextSprite = next_sprite;
        
        if (state_id != StateTvWhitenoise)
            smc_set_state(StateTvWhitenoise);
    }
}

function TvDoExpression(tv_id, sprite, duration)
{
    with (tv_id)
    {
        exprTimer.maxTime = duration;
        TvDoWhitenoise(tv_id, StateTvExpression, sprite);
    }
}