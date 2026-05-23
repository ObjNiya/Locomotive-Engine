if (!surface_exists(guiSurf))
    guiSurf = surface_create(display_get_gui_width(), display_get_gui_height());
else if (guiDoResize)
{ 
    surface_resize(guiSurf, display_get_gui_width(), display_get_gui_height());
    guiDoResize = false;
}

surface_set_target(guiSurf);
draw_clear_alpha(c_black, 0);