var app_x = 0;
var app_y = 0;

var app_x_scale = 1;
var app_y_scale = 1;
var app_scale = 1;

var app_width = GAME_WIDTH;
var app_height = GAME_HEIGHT;

switch (scaling_mode)
{
    case SCALING_MODES.STRETCH:
        draw_surface_stretched(application_surface, 0, 0, window_get_width(), window_get_height());
        break;
    
    case SCALING_MODES.FIT:
    case SCALING_MODES.INTEGER:
        app_x_scale = (window_get_width() / GAME_WIDTH);
        app_y_scale = (window_get_height() / GAME_HEIGHT);
        
        app_scale = min(app_x_scale, app_y_scale);
        if (scaling_mode == SCALING_MODES.INTEGER)
            app_scale = floor(app_scale);
        
        app_width = GAME_WIDTH * app_scale;
        app_height = GAME_HEIGHT * app_scale;
        
        app_x = (window_get_width() / 2) - (app_width / 2);
        app_y = (window_get_height() / 2) - (app_height / 2);
        
        draw_surface_ext(application_surface, app_x, app_y, app_scale, app_scale, 0, c_white, 1);
        break;

    case SCALING_MODES.PIXEL_PERFECT:
        app_x = (window_get_width() / 2) - (GAME_WIDTH / 2);
        app_y = (window_get_height() / 2) - (GAME_HEIGHT / 2);
        
        draw_surface(application_surface, app_x, app_y);
        break;
}