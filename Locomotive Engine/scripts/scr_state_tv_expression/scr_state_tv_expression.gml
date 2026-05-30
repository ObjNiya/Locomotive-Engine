/// @ignore
function StateTvExpressionStart()
{
    exprTimer.Start();
}

/// @ignore
function StateTvExpressionStep()
{

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