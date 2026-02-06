event_inherited();

cameras = [];
camera_indices = array_create(7, -1);

function set_up_viewports()
{
    var camera_count = array_length(cameras);
    
    room_set_view_enabled(room, true);
    
    for (var i = 0; i < 7; i++)
    {
        var camera_index = camera_indices[i];
        
        if (camera_index = -1)
            continue;
        
        view_visible[i] = true;
        view_enabled[i] = true;
        
        view_wport[i] = GAME_WIDTH;
        view_hport[i] = GAME_HEIGHT;
        
        view_camera[i] = cameras[camera_index].id;
    }
}