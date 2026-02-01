if (scaling_mode == SCALING_MODES.PIXEL_PERFECT)
{
    application_width = GAME_WIDTH;
    application_height = GAME_HEIGHT;
    
    exit;
}

if (scaling_mode == SCALING_MODES.STRETCH)
{
    application_width = window_get_width();
    application_height = window_get_height();
    
    exit;
}

var window_xscale = window_get_width() / GAME_WIDTH;
var window_yscale = window_get_height() / GAME_HEIGHT;

application_scale = min(window_xscale, window_yscale);
var floor_application_scale = floor(application_scale);

if (scaling_mode == SCALING_MODES.INTEGER && floor_application_scale != 0)
    application_scale = floor_application_scale;  

application_width = GAME_WIDTH * application_scale;
application_height = GAME_HEIGHT * application_scale;
