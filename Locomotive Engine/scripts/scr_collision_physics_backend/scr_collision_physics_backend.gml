#macro PHYSICS_CATCH_INVALID_AXIS axis_var = string_lower(axis) if (axis_var != "x" && axis_var != "y") { trace("Invalid axis for physics calculations.") return }
function __physics_calc_intercepts__(axis_var)
{
    PHYSICS_CATCH_INVALID_AXIS;
    
    if (axis_var == "x")
    {
        var prev_x = x;
        
        if (abs(grav_dir) == 2)
            hsp += grav * sign(grav_dir);
        
        x += hsp;
        var sign_hsp = sign(hsp);
        
        
    }
}

function __physics_calc_axis__(axis_var)
{
    axis_var = string_lower(axis_var);
        
    if (axis_var != "x" && axis_var != "y")
    {
        trace("Invalid axis for physics calculations.");
        return;
    }
    
    var sign_spd = 0;
    
    var prev_pos = variable_instance_get(id, axis_var);
    
    if (axis_var == "x")
    {

    }
    else
    {
        var prev_y = y; 
        
        if (abs(grav_dir) == 1)
            vsp += grav * grav_dir;
        
        y += vsp;
        sign_spd = sign(vsp);
        
        collider_list = collision_line_list(x, prev_y, x, y, global.colliders, false, true, collider_list, false);
    }
    
    if (ds_list_empty(collider_list))
        return;
    
    trace("COLLIDE")
    var collider = collider_list[| 0];
    
    ds_list_clear(collider_list);
    
    if (sign_spd == 1)
        return (axis_var == "y") ? collider.bbox_top : collider.bbox_left;
    else if (sign_spd == -1)
        return (axis_var == "y") ? collider.bbox_bottom : collider.bbox_right;
    else
        return cur_pos;
}