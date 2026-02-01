event_inherited();

enum SCALING_MODES
{
    FIT,
    STRETCH,
    INTEGER,
    PIXEL_PERFECT,
}

scaling_mode = SCALING_MODES.INTEGER;

application_x = 0;
application_y = 0;

application_width = GAME_WIDTH;
application_height = GAME_HEIGHT;
application_scale = 1;


gui_surface = -1;

application_surface_draw_enable(false);
surface_resize(application_surface, application_width, application_height);