function TvDoWhitenoise(tv_id, next_state, next_sprite)
{
    with (tv_id)
    {
        whitenoiseNextState = next_state;
        whitenoiseNextSprite = next_sprite;
        
        if (stateName != "Whitenoise")
            SmcSetState("Whitenoise");
    }
}

function TvDoExpression(tv_id, sprite, duration)
{
    with (tv_id)
    {
        exprTimer.maxTime = duration;
        TvDoWhitenoise(tv_id, "Expression", sprite);
    }
}