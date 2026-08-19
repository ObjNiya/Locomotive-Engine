if (instance_number(object_index) > 1)
    instance_destroy();

// Global Variables

global.appVisualWidth = 0;
global.appVisualHeight = 0;
global.guiMaxScale = 1;

// Other Variables

appX = 0;
appY = 0;
appXScale = 1;
appYScale = 1;
appPauseSpr = -1;
appScriptBegin = -1;
appScriptEnd = -1;

guiSurf = -1;
guiDoResize = false;
guiPauseSpr = -1;
guiScriptBegin = -1;
guiScriptEnd = -1;

prevWindowWidth = window_get_width();
prevWindowHeight = window_get_height();

if (window_get_fullscreen())
{
    prevWindowWidth = display_get_width();
    prevWindowHeight = display_get_height();
}

if (is_string(fullscreenKey))
    fullscreenKey = ord(fullscreenKey);

// Set-Up

application_surface_draw_enable(false);
window_enable_borderless_fullscreen(true);
AppSetAspectRatio(GetResAspectRatio());