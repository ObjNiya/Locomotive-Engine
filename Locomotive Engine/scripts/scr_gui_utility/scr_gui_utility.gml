function get_gui_width()
{
    with (obj_screensizer)
        return surface_get_width(gui_surf);
}

function get_gui_height()
{
    with (obj_screensizer)
        return surface_get_height(gui_surf);
}