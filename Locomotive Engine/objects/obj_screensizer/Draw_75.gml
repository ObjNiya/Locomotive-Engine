surface_reset_target();

var gui_x = window_to_gui_x(appX);
var gui_y = window_to_gui_y(appY);

var gui_xscale = appVisualWidth / window_get_width(); 
var gui_yscale = appVisualHeight / window_get_height();

if (appWidth < GAME_WIDTH)
    gui_xscale *= appXScale;
if (appHeight < GAME_HEIGHT)
    gui_yscale *= appYScale;

draw_surface_ext(guiSurf, gui_x, gui_y, gui_xscale * guiScale, gui_yscale * guiScale, 0, c_white, 1);
if (sprite_exists(guiOverlay))
    draw_sprite_ext(guiOverlay, 0, gui_x, gui_y, gui_xscale * guiScale, gui_yscale * guiScale, 0, c_white, 1);