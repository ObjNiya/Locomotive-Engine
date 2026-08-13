var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

if (!surface_exists(guiSurf))
    guiSurf = surface_create(gui_width, gui_height);
else if (guiDoResize)
{ 
    surface_resize(guiSurf, gui_width, gui_height);
    guiDoResize = false;
}

surface_set_target(guiSurf);
draw_clear_alpha(c_black, 0);