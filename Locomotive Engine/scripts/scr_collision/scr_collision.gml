function check_collide_array_precise(collider_to_check, collider_a_x_offset = 0, collider_a_y_offset = 0, tag_filter = -1)
{
    var i = 0;
    var touched_colliders = [];
    var collider_count = array_length(global.colliders);
    
    repeat (collider_count)
    {
        var collider = global.colliders[i];
        
        if (colliders_touching(collider_to_check, collider, collider_a_x_offset, collider_a_y_offset, tag_filter))
            array_push(touched_colliders, collider);
        
        i++;
    }
    
    return touched_colliders;
}

function check_collide_array(collider_to_check, collider_a_x_offset = 0, collider_a_y_offset = 0, tag_filter = -1)
{
    var i = 0;
    var touched_colliders = [];
    var collider_count = array_length(global.colliders);
    
    repeat (collider_count)
    {
        var collider = global.colliders[i];
        
        if (colliders_touching(collider_to_check, collider, collider_a_x_offset, collider_a_y_offset, 0, 0, tag_filter))
            array_push(touched_colliders, collider);
        
        i++;
    }
    
    return touched_colliders;
}

function check_collide_id_precise(collider_to_check, collider_a_x_offset = 0, collider_a_y_offset = 0, tag_filter = -1)
{
    var i = 0;
    var collider_count = array_length(global.colliders);
    
    repeat (collider_count)
    {
        var collider = global.colliders[i];
        
        if (colliders_touching_precise(collider_to_check, collider, collider_a_x_offset, collider_a_y_offset, tag_filter))
            return collider;
        
        i++;
    }
    
    return -1;
}

function check_collide_precise(collider_to_check, collider_a_x_offset = 0, collider_a_y_offset = 0, tag_filter = -1)
{
    return (check_collide_id_precise(collider_to_check, collider_a_x_offset, collider_a_y_offset, tag_filter) != -1);
}

function check_collide_id(collider_to_check, collider_a_x_offset = 0, collider_a_y_offset = 0, tag_filter = -1)
{
    var i = 0;
    var collider_count = array_length(global.colliders);
    
    repeat (collider_count)
    {
        var collider = global.colliders[i];
        
        if (colliders_touching(collider_to_check, collider, collider_a_x_offset, collider_a_y_offset, 0, 0, tag_filter))
            return collider;
        
        i++;
    }
    
    return -1;
}

function check_collide(collider_to_check, collider_a_x_offset = 0, collider_a_y_offset = 0, tag_filter = -1)
{
    return (check_collide_id(collider_to_check, collider_a_x_offset, collider_a_y_offset, tag_filter = -1) != -1);
}

function slope_get_progress(near_collider, slope_collider)
{
    if (!slope_collider.is_slope)
        return -1;
    
    var slope_width = slope_collider.r - slope_collider.l;
    var near_x = (!slope_collider.slope_flip_x) ? near_collider.r : near_collider.l;
    var progress = (near_x - slope_collider.l) / slope_width;
    
    progress = clamp(progress, 0, 1);
    if (slope_collider.slope_flip_x)
        progress = 1 - progress;
    
    return progress;
}

function check_collide_contains_slope(colliders_array)
{
	var i = 0;
    var collider_count = array_length(colliders_array);
    
    repeat (collider_count)
    {
        var collider = colliders_array[i];
        
        if collider.is_slope
            return true;
        
        i++;
    }
    
    return false;
}

function check_collide_find_slope(colliders_array)
{
	var i = 0;
    var collider_count = array_length(colliders_array);
    
    repeat (collider_count)
    {
        var collider = colliders_array[i];
        
        if collider.is_slope
            return collider;
        
        i++;
    }
    
    return -1;
}
