/**
 * This function will trigger the given expression on the GUI TV.
 * @parameter {String} expression The expression variable to play as a string EXCLUDING the ```expr_``` prefix found in the expression variable names.
 * @returns {Bool}
 */
function hud_tv_trigger_expression(expression)
{
    with (obj_hud_tv)
    {
        var expr_variable = variable_instance_get(id, "expr_" + expression);
        
        if (is_undefined(expr_variable) || expr_variable.sprite_index == sprite_index)
            return false;
        
        current_expr = expr_variable;
        whitenoise_next_state = state_tv_expression();
        
        if (state_id != state_tv_whitenoise)
            smc_set_state(state_tv_whitenoise);
        
        return true;
    }
}