if (!surface_exists(gui_surface))
    gui_surface = surface_create(application_width, application_height);

if (gui_queue_resize)
{ 
    surface_resize(gui_surface, application_width, application_height);
    gui_queue_resize = false;
}

surface_set_target(gui_surface);
draw_clear_alpha(c_black, 0);