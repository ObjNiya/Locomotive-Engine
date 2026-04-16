/// @ignore
function __update_screen__(xscale, yscale)
{
    with (obj_screensizer)
    {
        var app_width = surface_get_width(application_surface);
        var app_height = surface_get_height(application_surface);
        
        actual_width = GAME_WIDTH;
        actual_height = GAME_HEIGHT;
        
        if (dynamic_res)
        {
            actual_xscale = xscale;
            actual_yscale = yscale;
        }
        else
        { 
            actual_xscale = 1;
            actual_yscale = 1;
            
            actual_width *= xscale;
            actual_height *= yscale;
        }
        
        actual_width = max(actual_width, 1);
        actual_height = max(actual_height, 1);
        
        self.xscale = xscale;
        self.yscale = yscale;
        
        width = actual_width * actual_xscale;
        height = actual_height * actual_yscale;
        
        x = (window_get_width() / 2) - (width / 2);
        y = (window_get_height() / 2) - (height / 2);
        
        if (app_width != actual_width || app_height != actual_height)
        {
            surface_resize(application_surface, actual_width, actual_height);
            //display_set_gui_maximise(-1, -1);
            
            display_set_gui_size(actual_width, actual_height); 
            
            gui_queue_resize = true;
        }
    }
}

function update_screen_size()
{
    with (obj_screensizer) 
    { 
        var xscale = window_get_width() / GAME_WIDTH;
        var yscale = window_get_height() / GAME_HEIGHT;

        if (scaling_mode == SCALING_MODES.STRETCH)
        {
            __update_screen__(xscale, yscale);
            return;
        }
        
        var min_scale = min(xscale, yscale);
        var floor_scale = floor(min_scale);
        
        if (scaling_mode == SCALING_MODES.PIXEL_PEFECT)
            min_scale = min(min_scale, 1);
        else if (scaling_mode == SCALING_MODES.INTEGER && floor_scale > 0)
            min_scale = floor_scale;
        
        __update_screen__(min_scale, min_scale);
    }
}

function set_scaling_mode(target_scaling_mode)
{
    with (obj_screensizer)
    {
        if (scaling_mode == target_scaling_mode)
            return false;
        
        scaling_mode = target_scaling_mode;
        update_screen_size();
        
        return true;
    }
}

function set_dynamic_res(dynamic_res_enabled)
{
    with (obj_screensizer)
    {
        if (dynamic_res == dynamic_res_enabled)
            return false;
        
        dynamic_res = dynamic_res_enabled;
        __update_screen__(xscale, yscale);
        
        return true;
    }
}

