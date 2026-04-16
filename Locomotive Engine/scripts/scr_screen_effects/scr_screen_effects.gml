function set_screen_effects(blend, alpha)
{
    with (obj_screensizer)
    {
        app_blend = blend;
        app_alpha = alpha;
    }
}

function set_screen_draw_prefix(func = function() {})
{
    with (obj_screensizer)
        app_draw_prefix = func;
}

function set_screen_draw_postfix(func = function() {})
{
    with (obj_screensizer)
        app_draw_postfix = func;
}