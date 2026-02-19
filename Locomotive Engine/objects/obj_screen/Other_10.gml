// app Surface

if (scaling_mode == SCALING_MODES.STRETCH)
{
    app_width = window_get_width();
    app_height = window_get_height();
    
    exit;
}

var window_xscale = window_get_width() / GAME_WIDTH;
var window_yscale = window_get_height() / GAME_HEIGHT;

app_scale = min(window_xscale, window_yscale);
if (scaling_mode == SCALING_MODES.PIXEL_PERFECT && app_scale > 1)
    app_scale = 1;

var floor_app_scale = floor(app_scale);

if (scaling_mode == SCALING_MODES.INTEGER && floor_app_scale != 0)
    app_scale = floor_app_scale;  

app_width = GAME_WIDTH * app_scale;
app_height = GAME_HEIGHT * app_scale;

app_width = max(app_width, 1);
app_height = max(app_height, 1);