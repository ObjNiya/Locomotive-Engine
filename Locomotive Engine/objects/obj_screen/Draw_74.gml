if (!surface_exists(gui_surface))
    gui_surface = surface_create(display_get_gui_width(), display_get_gui_height());

//trace("Width: ", application_width)
//trace("Height: ", application_height)

if (display_get_gui_width() != surface_get_width(gui_surface) || display_get_gui_height() != surface_get_height(gui_surface)) 
    surface_resize(gui_surface, display_get_gui_width(), display_get_gui_height());

surface_set_target(gui_surface);
draw_clear_alpha(c_black, 0);