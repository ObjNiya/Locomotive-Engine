function ScreenSetSize(width, height)
{
    width = floor(width);
    height = floor(height);
    
    with (obj_screensizer)
    {
        if (appVisualWidth == width && appVisualHeight == height)
            return;
        
        appVisualWidth = width;
        appVisualHeight = height;
        appVisualXScale = appVisualWidth / GAME_WIDTH;
        appVisualYScale = appVisualHeight / GAME_HEIGHT;
        
        if (appIsScaled)
        {
            appWidth = GAME_WIDTH;
            appHeight = GAME_HEIGHT;
            
            appXScale = appVisualXScale;
            appYScale = appVisualYScale;
            
            guiWidth = GAME_WIDTH;
            guiHeight = GAME_HEIGHT;
        }
        else
        {
            appWidth = appVisualWidth;
            appHeight = appVisualHeight;
            
            appXScale = 1;
            appYScale = 1;
            
            guiWidth = max(appWidth, GAME_WIDTH);
            guiHeight = max(appHeight, GAME_HEIGHT);
        }
        
        var window_width = window_get_width();
        var window_height = window_get_height();
        
        appX = (window_width / 2) - (appVisualWidth / 2);
        appY = (window_height / 2) - (appVisualHeight / 2);
        
        if (appWidth != surface_get_width(application_surface) || appHeight != surface_get_height(application_surface))
            surface_resize(application_surface, appWidth, appHeight);
        
        if (guiWidth != display_get_gui_width() || guiHeight != display_get_gui_height())
        {
            display_set_gui_size(guiWidth, guiHeight);
            guiDoResize = true;
        }
    }
}

function ScreenUpdate()
{
    with (obj_screensizer)
    { 
        if (resizingMode == RESIZING_MODES.STRETCH)
        {
            ScreenSetSize(window_get_width(), window_get_height());
            return;
        }
        
        var game_xscale = window_get_width() / GAME_WIDTH;
        var game_yscale = window_get_height() / GAME_HEIGHT;
        
        game_xscale = min(game_xscale, game_yscale);
        game_yscale = game_xscale;
        
        if (resizingMode != RESIZING_MODES.INTEGER)
        {
            ScreenSetSize(GAME_WIDTH * game_xscale, GAME_HEIGHT * game_yscale);
            return;
        }
        
        var floor_scale = floor(game_xscale);
        if (floor_scale == 0)
            floor_scale = game_xscale;
        
        ScreenSetSize(GAME_WIDTH * floor_scale, GAME_HEIGHT * floor_scale);
    }
}

function CalcGuiX(xx)
{
    var mult = (obj_screensizer.guiWidth / obj_screensizer.guiScale) / GAME_WIDTH;
    return xx * mult;
}

function CalcGuiY(yy)
{
    var mult = (obj_screensizer.guiHeight / obj_screensizer.guiScale) / GAME_HEIGHT;
    return yy * mult;
}

function AlignToGuiX(align, offset = 0)
{
    if (align == fa_left)
        return offset;
    
    var divider = (align == fa_center) ? 2 : 1;
    return ((obj_screensizer.guiWidth / obj_screensizer.guiScale) / divider) + offset;
}

function AlignToGuiY(align, offset = 0)
{
    if (align == fa_top)
        return offset;
    
    var divider = (align == fa_middle) ? 2 : 1;
    return ((obj_screensizer.guiHeight / obj_screensizer.guiScale) / divider) + offset;
}
