function TvTriggerExpr(tv_id, sprite, whitenoise, duration, step_func = function() { return true })
{
    with (tv_id)
    {
        whitenoiseNextState = StateTvExpression;
        whitenoiseNextSprite = sprite;
        
        exprTimer = duration;
        exprStep = step_func;
        
        if (whitenoise && state_id != StateTvWhitenoise) 
            smc_set_state(StateTvWhitenoise);
        else if (!whitenoise)
        {
            sprite_index = sprite;
            smc_set_state(StateTvExpression);
        }
    }
}