surface_reset_target();

var gui_x = window_to_gui_x(app_x);
var gui_y = window_to_gui_y(app_y);

var gui_xscale = app_visual_width / window_get_width(); 
var gui_yscale = app_visual_height / window_get_height();

draw_surface_ext(gui_surf, gui_x, gui_y, gui_xscale, gui_yscale, 0, c_white, 1);