if (!surface_exists(gui_surface))
    gui_surface = surface_create(application_width, application_height);

if (application_width != surface_get_width(gui_surface) || application_height != surface_get_height(gui_surface)) 
    surface_resize(gui_surface, application_width, application_height);

surface_set_target(gui_surface);
draw_clear_alpha(c_black, 0);