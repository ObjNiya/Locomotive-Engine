/// @ignore
function Camera(instance_to_follow) constructor
{
    var view = 0;
    
    while (view_camera[view] == -1)
    {
        if (view++ > 7)
        {
            log(Camera, LOG_TYPES.WARNING, ["Camera limit reached! Camera with target ", instance_to_follow, " will not be added."])
            return;
        }    
    }
    
    viewport = view;
    id = camera_create_view(0, 0, GAME_WIDTH, GAME_HEIGHT);
    
    target = instance_to_follow;

    fmod_studio_system_set_num_listeners(viewport);
    fmod_attr = new Fmod3DAttributes();
    
    with (fmod_attr)
    {
        forward.z = 1;
        up.y = 1; 
    }
    
    x_offsets = {};
    y_offsets = {};
    zooms = { base_val: 1 };
    
    locked = false;
    
    static room_start = function()
    {
        if (!view_enabled)
            view_enabled = true;
        
        view_visible[viewport] = true;
        view_wport[viewport] = GAME_WIDTH;
        view_hport[viewport] = GAME_HEIGHT;
        view_camera[viewport] = id;
    }
    
    static step = function()
    {
        if (locked)
            exit;
        
        // Calculate certain attributes
        
        var zoom = struct_get_sum(zooms);
        var x_offset = struct_get_sum(x_offsets);
        var y_offset = struct_get_sum(y_offsets);
        
        var fin_width = GAME_WIDTH / zoom;
        var fin_height = GAME_HEIGHT / zoom;
        
        camera_set_view_size(id, fin_width, fin_height);
        
        var mid_width = (fin_width / 2);
        var mid_height = (fin_height / 2);
        
        var fin_x = clamp(target.x - mid_width + x_offset, 0, room_width - fin_width);
        var fin_y = clamp(target.y - 50 - mid_height + y_offset, 0, room_height - fin_height);
        
        camera_set_view_pos(id, fin_x, fin_y);
        
        with (fmod_attr.position)
        {
            x = fin_x + mid_width;
            y = fin_y + mid_height;
        }
        
        fmod_studio_system_set_listener_attributes(viewport, fmod_attr);
    }
    
    static destroy = function()
    {
        camera_destroy(id);
        
        view_visible[viewport] = false;
        view_camera[viewport] = -1;
    }
}