function set_gui_effects(blend, alpha)
{
    with (obj_screensizer)
    {
        gui_blend = blend;
        gui_alpha = alpha;
    }
}

function set_gui_draw_prefix(func = function() {})
{
    with (obj_screensizer)
        gui_draw_prefix = func;
}

function set_gui_draw_postfix(func = function() {})
{
    with (obj_screensizer)
        gui_draw_postfix = func;
}