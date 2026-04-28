function screen_set_size(width, height)
{
    width = floor(width);
    height = floor(height);
    
    with (obj_screensizer)
    {
        if (app_visual_width == width && app_visual_height == height)
            return;
        
        app_visual_width = width;
        app_visual_height = height;
        app_visual_xscale = app_visual_width / GAME_WIDTH;
        app_visual_yscale = app_visual_height / GAME_HEIGHT;
        
        if (app_is_scaled)
        {
            app_width = GAME_WIDTH;
            app_height = GAME_HEIGHT;
            
            app_xscale = app_visual_xscale;
            app_yscale = app_visual_yscale;
        }
        else
        {
            app_width = app_visual_width;
            app_height = app_visual_height;
            
            app_xscale = 1;
            app_yscale = 1;
        }
        
        var window_width = window_get_width();
        var window_height = window_get_height();
        
        app_x = (window_width / 2) - (app_visual_width / 2);
        app_y = (window_height / 2) - (app_visual_height / 2);
        
        if (app_width != surface_get_width(application_surface) || app_height != surface_get_height(application_surface))
            surface_resize(application_surface, app_width, app_height);
        
        if (app_width != display_get_gui_width() || app_height != display_get_gui_height())
        {
            display_set_gui_size(app_width, app_height);
            gui_do_resize = true;
        }
    }
}

function screen_update()
{
    with (obj_screensizer)
    { 
        if (resizing_mode == RESIZING_MODES.STRETCH)
        {
            screen_set_size(window_get_width(), window_get_height());
            return;
        }
        
        var game_xscale = window_get_width() / GAME_WIDTH;
        var game_yscale = window_get_height() / GAME_HEIGHT;
        
        game_xscale = min(game_xscale, game_yscale);
        game_yscale = game_xscale;
        
        if (resizing_mode != RESIZING_MODES.INTEGER)
        {
            screen_set_size(GAME_WIDTH * game_xscale, GAME_HEIGHT * game_yscale);
            return;
        }
        
        var floor_scale = floor(game_xscale);
        if (floor_scale == 0)
            floor_scale = game_xscale;
        
        screen_set_size(GAME_WIDTH * floor_scale, GAME_HEIGHT * floor_scale);
    }
}