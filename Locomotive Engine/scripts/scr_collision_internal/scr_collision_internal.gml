function slope_get_progress(near_collider, slope_collider)
{
    if (!slope_collider.is_slope)
        return -1;
    
    var slope_width = slope_collider.right - slope_collider.left;
    var near_x = (!slope_collider.slope_flip_x) ? near_collider.right : near_collider.left;
    var progress = (near_x - slope_collider.left) / slope_width;
    
    progress = clamp(progress, 0, 1);
    if (slope_collider.slope_flip_x)
        progress = 1 - progress;
    
    return progress;
}