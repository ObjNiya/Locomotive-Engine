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

resizingMode = RESIZING_MODES.FIT;

appIsScaled = true;
appX = 0;
appY = 0;
appXScale = 1;
appYScale = 1;
appWidth = GAME_WIDTH;
appHeight = GAME_HEIGHT;

appVisualWidth = GAME_WIDTH;
appVisualHeight = GAME_HEIGHT;
appVisualXScale = 1;
appVisualYScale = 1;

prevWindowWidth = window_get_width();
prevWindowHeight = window_get_height();

guiSurf = -1;
guiDoResize = false;
guiWidth = GAME_WIDTH;
guiHeight = GAME_HEIGHT;
guiMaxScale = 1;
guiScale = 1;

application_surface_draw_enable(false);
window_enable_borderless_fullscreen(true); 
ScreenUpdate();