state_machine_initialize();

tvbg_sprite = spr_tvbg_hallway;
tvbg_scroll = 0;

/////////////////////////////
/// Idle state set-up
/////////////////////////////

idle_animation_timer = new Timer(4 + irandom_range(-1, 2), time_source_units_seconds, function() {
    sprite_index_set(choose(spr_tv_idle_animation1, spr_tv_idle_animation2), 0);
    
    max_time = 4 + irandom_range(-1, 2);
})
idle_animation_timer.set_ext(1, true);

state_machine_set_state(state_tv_idle());

/////////////////////////////
// Whitenoise flash variables
/////////////////////////////

whitenoise = new Sprite(spr_tv_whitenoise_damian);
with (whitenoise)
{
    x = other.x;
    y = other.y;
    
    image_alpha = 0;
    image_speed = 0;
}

whitenoise_next_state = -1;

/////////////////////////////
// Expression set-up
/////////////////////////////

/**
 * This function will return a struct according to the given arguments to be set to a variable to define a TV expression.
 * @parameter {Asset.GMSprite} sprite_index The index of the TV sprite to be displayed when the expression is active.
 * @parameter {Function} func The function to run every frame the expression is active, this function should return ```false``` when the expression should stop and return to the idle state, otherwise, it should return ```true```.
 */
function define_expression(sprite_index, func)
{
    return
    {
        sprite_index,
        func
    }
}

current_expr = -1;

expr_mach3 = define_expression(spr_tv_mach3_damian, function() {
    with (par_player)
    {
        if (state_step == state_player_machturn_step && !equals_to_either(sprite_index, [spr_mach2_turn_intro, spr_mach2_turn]))
            return true;
        
        if (player_get_mach_stage() >= 3 && state_step == state_player_mach_step)
        {
            if (player_get_mach_stage() >= 4)
                hud_tv_trigger_expression("mach4");
            return true;
        }
        
        return false;
    }
});

expr_mach4 = define_expression(spr_tv_mach4_damian, function() {
    with (par_player)
    {
        if (state_step == state_player_machturn_step && !equals_to_either(sprite_index, [spr_mach2_turn_intro, spr_mach2_turn]))
        {
            hud_tv_trigger_expression("mach3");
            return true;
        }
        
        if (player_get_mach_stage() > 2 && state_step == state_player_mach_step)
        {
            if (player_get_mach_stage() < 4)
                hud_tv_trigger_expression("mach3");
        }
        
        return false;
    }
});
