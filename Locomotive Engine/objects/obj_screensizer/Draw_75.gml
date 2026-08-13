surface_reset_target();

var gui_x = __Window2GuiX__(appX);
var gui_y = __Window2GuiY__(appY);

var gui_scale = GuiGetScale();
var gui_xscale = global.appVisualWidth / window_get_width(); 
var gui_yscale = global.appVisualHeight / window_get_height();

if (surface_get_width(application_surface) < global.baseAppWidth)
    gui_xscale *= appXScale;
if (surface_get_height(application_surface) < global.baseAppHeight)
    gui_yscale *= appYScale;

if (guiScriptBegin != -1)
    guiScriptBegin();

if (gui_scale != 1)
    draw_surface_part_ext(guiSurf, 0, 0, display_get_gui_width() / gui_scale, display_get_gui_height() / gui_scale, gui_x, gui_y, gui_xscale * gui_scale, gui_yscale * gui_scale, c_white, 1);
else
    draw_surface_ext(guiSurf, gui_x, gui_y, gui_xscale * gui_scale, gui_yscale * gui_scale, 0, c_white, 1);

if (guiScriptEnd != -1)
    guiScriptEnd();