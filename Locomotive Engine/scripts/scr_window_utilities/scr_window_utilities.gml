function window_to_gui_x(x)
{
    return display_get_gui_width() * (x / window_get_width());
}

function window_to_gui_y(y)
{
    return display_get_gui_height() * (y / window_get_height());
}

function window_to_gui_xscale(xscale)
{
    return (xscale * display_get_gui_width()) / window_get_width();
}

function window_to_gui_yscale(yscale)
{
    return (yscale * display_get_gui_height()) / window_get_height();
}