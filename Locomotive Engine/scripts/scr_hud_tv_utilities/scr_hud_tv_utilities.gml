function hud_tv_trigger_expression(expression)
{
    with (obj_hud_tv)
    {
        var expr_variable = variable_instance_get(id, "expr_" + expression);
        
        if (is_undefined(expr_variable) || expr_variable.sprite_index == sprite_index)
            return;
        
        current_expr = expr_variable;
        whitenoise_next_state = state_tv_expression();
        
        if (state_step != state_tv_whitenoise_step)
            state_machine_set_state(state_tv_whitenoise());
        
        return;
    }
}