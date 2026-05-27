/// @ignore
function StateTvExpressionStart()
{
    
}

/// @ignore
function StateTvExpressionStep()
{
    if (exprStep() && exprTimer-- > 0)
        return;
    
    whitenoiseNextState = StateTvIdle;
    whitenoiseNextSprite = playerId.spr_tv_idle;
    smc_set_state(StateTvWhitenoise);
}

/// @ignore
function StateTvExpressionEnd()
{
    
}

/**
 * This function will return an array of the tvexpression state events to be given to the ```smc_set_state``` function to change the tv's state.
 * @returns {Array<Function>}
 * @pure
 */
function StateTvExpression()
{
    return [StateTvExpressionStart, StateTvExpressionStep, StateTvExpressionEnd];
}