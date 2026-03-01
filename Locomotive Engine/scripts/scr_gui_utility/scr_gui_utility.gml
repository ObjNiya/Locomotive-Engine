function get_gui_width()
{
    with (obj_screen)
        return surface_get_width(gui_surface);
}

function get_gui_height()
{
    with (obj_screen)
        return surface_get_height(gui_surface);
}