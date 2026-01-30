event_inherited();

enum SCALING_MODES
{
    FIT,
    STRETCH,
    INTEGER,
    PIXEL_PERFECT,
}

scaling_mode = SCALING_MODES.FIT;
gui_surface = -1;

application_surface_draw_enable(false);
surface_resize(application_surface, GAME_WIDTH, GAME_HEIGHT);