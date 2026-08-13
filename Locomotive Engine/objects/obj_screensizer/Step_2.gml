if (global.adaptAspectRatio)
{
    if (AppSetAspectRatio(display_get_width() / display_get_height()))
        exit;
}

var width = window_get_width();
var height = window_get_height();

if (toggleFullscreen && keyboard_check_pressed(fullscreenKey))
{
    window_set_fullscreen(!window_get_fullscreen());
    window_center();
    __ResizeScreen__();
    
    exit;
}

if (prevWindowWidth == width && prevWindowHeight == height)
    exit;

prevWindowWidth = width;
prevWindowHeight = height;

__ResizeScreen__();