if (!surface_exists(gui_surface))
    gui_surface = surface_create(app_width, app_height);

if (gui_queue_resize)
{ 
    surface_resize(gui_surface, app_width, app_height);
    gui_queue_resize = false;
}

surface_set_target(gui_surface);
draw_clear_alpha(c_black, 0);