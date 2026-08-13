/// @ignore
function __Gcd__(a, b)
{
    return (b == 0) ? a : __Gcd__(b, a % b);
}

/// @ignore
function __ResizeScreen__()
{
    if (is_undefined(argument[0]) || is_undefined(argument[1])) 
    {
        var width = window_get_width();
        var height = window_get_height();
        
        if (window_get_fullscreen())
        {
            width = display_get_width();
            height = display_get_height();
        }
        
        if (global.resizingMode == RESIZING_MODES.STRETCH)
        {
            __ResizeScreen__(width, height);
            return;
        }
        
        var app_xscale = width / global.baseAppWidth;
        var app_yscale = height / global.baseAppHeight;
        var app_scale = min(app_xscale, app_yscale);
        
        if (global.resizingMode == RESIZING_MODES.INTEGER && app_scale >= 1)
            app_scale = floor(app_scale);
        
        __ResizeScreen__(global.baseAppWidth * app_scale, global.baseAppHeight * app_scale);
        return;
    }
    
    var width = max(1, round(argument[0]));
    var height = max(1, round(argument[1]));
    
    global.appVisualWidth = width;
    global.appVisualHeight = height;

    var app_width = global.appVisualWidth;
    var app_height = global.appVisualHeight;
    
    var gui_width = max(app_width, global.baseAppWidth);
    var gui_height = max(app_height, global.baseAppHeight);
    
    if (global.pixelPerfect)
    {
        app_width = global.baseAppWidth;
        app_height = global.baseAppHeight;
        gui_width = global.baseAppWidth;
        gui_height = global.baseAppHeight;
    }
    
    if (surface_get_width(application_surface) != app_width || surface_get_height(application_surface) != app_height)
        surface_resize(application_surface, app_width, app_height);
    
    if (display_get_gui_width() != gui_width || display_get_gui_height() != gui_height)
    {
        display_set_gui_size(gui_width, gui_height);
        global.guiMaxScale = min(gui_width / global.baseAppWidth, gui_height / global.baseAppHeight);
        
        obj_screensizer.guiDoResize = true;
    }
    
    with (obj_screensizer)
    {
        appX = (window_get_width() / 2) - (global.appVisualWidth / 2);
        appY = (window_get_height() / 2) - (global.appVisualHeight / 2);
        
        appXScale = global.appVisualWidth / app_width;
        appYScale = global.appVisualHeight / app_height;
    }
}

/// @ignore
function __Window2GuiX__(x)
{
    return display_get_gui_width() * (x / window_get_width());
}

/// @ignore
function __Window2GuiY__(y)
{
    return display_get_gui_height() * (y / window_get_height());
}