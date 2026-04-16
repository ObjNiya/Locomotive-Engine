SINGLETON;

// Screen configurations

#macro GAME_WIDTH 960
#macro GAME_HEIGHT 540

enum SCALING_MODES
{
    FIT = 0, // Maintains aspect ratio, scales the screen to the highest possible.
    STRETCH = 1, // Stretches the screen to the window borders fully.
    INTEGER = 2, // Maintains aspect ratio, scales the screen to the highest possible integer for even pixels.
    PIXEL_PEFECT = 3, // Maintains the games actual base resolution.
}

/*
 * How should the screen be scaled/resized?
 */
scaling_mode = SCALING_MODES.INTEGER;

/*
 * Determines whether or not the screen will scale the screen or actually resize it according to the scaling mode.
 * Scaling the screen by the original resolution results in a pixel perfect like grid effect, at the cost of low quality sprite rotation and no GUI scaling.
 * Resizing the screen will use the extra pixel space created which is not pixel perfect, but allows for higher quality sprite rotation and GUI scaling.
 */
dynamic_res = true;

// Window resize check set-up

prev_window_width = window_get_width();
prev_window_height = window_get_height();

// Screen set-up

x = 0;
y = 0;

width = GAME_WIDTH;
height = GAME_HEIGHT;

xscale = 1;
yscale = 1;

actual_width = GAME_WIDTH;
actual_height = GAME_HEIGHT;

actual_xscale = 1;
actual_yscale = 1;

application_surface_draw_enable(false);
update_screen_size();
window_enable_borderless_fullscreen(true);

gui_surface = -1;
gui_scale = -1;
gui_queue_resize = false;