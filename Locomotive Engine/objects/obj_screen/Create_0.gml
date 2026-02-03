event_inherited();

// Scaling mode set-up

enum SCALING_MODES
{
    FIT = 0, // Will maintain the aspect ratio and scale the game to the highest possible
    STRETCH = 1, // Will stretch the game fully across the window without regard for the aspect ratio.
    INTEGER = 2, // Will maintain the aspect ratio and scale the game to the highest possible integer scale to prevent uneven pixels.
    PIXEL_PERFECT = 3, // Will maintain the aspect ratio and keep the game at 960x540 for 1 line thick pixels.
}

scaling_mode = SCALING_MODES.INTEGER;

// Window resize check set-up

previous_window_width = window_get_width();
previous_window_height = window_get_height();

// Application surface set-up

application_x = 0;
application_y = 0;

application_width = GAME_WIDTH;
application_height = GAME_HEIGHT;

application_scale = 1;

application_surface_draw_enable(false);
surface_resize(application_surface, application_width, application_height);

event_user(0);

// GUI surface set-up

gui_surface = -1;
gui_scale = -1;
gui_queue_resize = false;

// Other

window_enable_borderless_fullscreen(true);