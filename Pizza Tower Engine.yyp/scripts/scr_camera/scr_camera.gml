function attach_camera()
{
    with (instance_create_depth(x, y, depth, obj_camera))
    {
        target = other.id;
        camera = view_camera[instance_number(id) - 1];
        
        other.camera_id = id;
    }
}

function remove_camera()
{
    instance_destroy(camera_id);
    
    camera_id = noone;
}

function camera_set_offset(xoffset, yoffset, xspeed = 3, yspeed = 3)
{
    with (camera_id)
    {
        xoffset_target = xoffset;
        yoffset_target = yoffset;
        
        xoffset_speed = xspeed;
        yoffset_speed = yspeed;
    }
}

function camera_set_scale(xscale, yscale, xspeed = 0.2, yspeed = 0.2)
{
    with (camera_id)
    {
        xscale_target = xscale;
        yscale_target = yscale;
        
        xscale_speed = xspeed;
        yscale_speed = yspeed;
    }
}