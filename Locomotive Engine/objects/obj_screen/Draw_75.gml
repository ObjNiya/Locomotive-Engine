surface_reset_target();
/*
var gui_xscale = application_width / window_get_width();
var gui_yscale = application_height / window_get_height();

var suicidex = application_width / GAME_WIDTH
var suicidey = application_height / GAME_HEIGHT

if (scaling_mode == SCALING_MODES.INTEGER && suicidex > 1)
{

}

var mins = max(gui_xscale, gui_yscale)

var application_x = (window_get_width() / 2) - (application_width / 2);
var application_y = (window_get_height() / 2) - (application_height / 2);

//gui_xscale = min(1, gui_xscale)
//gui_yscale = min(1, gui_yscale)
*/

/*
var scale = application_width / GAME_WIDTH;

draw_surface_stretched(
    gui_surface,
    application_x,
    application_y,
    application_width / application_scale,
    application_height / application_scale
);
*/

//trace(display_get_gui_width())

var scalex = GAME_WIDTH / display_get_gui_width()
//scalex -= application_scale;
var scaley = GAME_HEIGHT / display_get_gui_height()
//scaley -= application_scale;



draw_surface_ext(gui_surface, 0, 0, scalex, scaley, 0, c_white, 1)
//draw_surface_ext(gui_surface, application_x*gui_xscale, application_y*gui_yscale, , , 0, c_white, 1);

