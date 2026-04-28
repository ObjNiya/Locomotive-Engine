SINGLETON;

// Screen configurations

#macro GAME_WIDTH 960
#macro GAME_HEIGHT 540

enum RESIZING_MODES
{
    INTEGER = 0,
    FIT = 1,
    STRETCH = 2,
}

resizing_mode = RESIZING_MODES.FIT;

app_is_scaled = true;
app_x = 0;
app_y = 0;
app_xscale = 1;
app_yscale = 1;
app_width = GAME_WIDTH;
app_height = GAME_HEIGHT;

app_visual_width = GAME_WIDTH;
app_visual_height = GAME_HEIGHT;
app_visual_xscale = 1;
app_visual_yscale = 1;

prev_window_width = window_get_width();
prev_window_height = window_get_height();

gui_surf = -1;
gui_do_resize = false;
gui_scale = infinity;

application_surface_draw_enable(false);
window_enable_borderless_fullscreen(true); 
screen_update();