enum GRAVITY_DIRECTIONS
{
    UP = -1,
    DOWN = 1,
    LEFT = -2,
    RIGHT = 2,
}


function initialize_physics()
{
    grav = 0;
    grav_dir_x = 0;
    grav_dir_y = 1;
    
    hsp = 0;
    vsp = 0;
    
    grounded = false;
    groundedSlope = false;
    
    collider_list = ds_list_create();
}



function physics_step()
{
    // X Axis
    
    hsp += grav * grav_dir_x;
    
    var prev_x = x;
    var sign_hsp = sign(hsp);
    
    x += hsp;
    
    collider_list = collision_line_list(prev_x + sign_hsp, y, x + sign_hsp, y, global.colliders, false, true, collider_list, false);
    
    if (!ds_list_empty(collider_list))
    {
        var collider = collider_list[| 0];

        if (sign_hsp == 1)
            x = collider.bbox_left;
        else if (sign_hsp == -1)
            x = collider.bbox_right;
        
        ds_list_clear(collider_list);
    }
    
    //__physics_calc_axis__("x");
    //__physics_calc_axis__("y");
}