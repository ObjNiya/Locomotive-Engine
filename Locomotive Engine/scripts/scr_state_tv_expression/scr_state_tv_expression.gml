/// @ignore
function state_tv_expression_start()
{
    sprite_index = current_expr.sprite_index;
}

/// @ignore
function state_tv_expression_step()
{
    if (current_expr.func())
        return;
    
    whitenoise_next_state = state_tv_idle();
    state_machine_set_state(state_tv_whitenoise());
}

/// @ignore
function state_tv_expression_end()
{
    
}

/**
 * This function will return an array of the tvexpression state events to be given to the ```state_machine_set_state``` function to change the tv's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_tv_expression()
{
    return [state_tv_expression_start, state_tv_expression_step, state_tv_expression_end];
}