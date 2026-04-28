if (!surface_exists(gui_surf))
    gui_surf = surface_create(display_get_gui_width(), display_get_gui_height());
else if (gui_do_resize)
{ 
    surface_resize(gui_surf, display_get_gui_width(), display_get_gui_height());
    gui_do_resize = false;
}

surface_set_target(gui_surf);