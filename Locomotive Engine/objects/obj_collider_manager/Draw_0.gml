array_foreach(global.colliders, function(value, index) {
    if (!value.active)
        return;
    
    if (value.is_slope)
    {
        var x1 = value.left;
        var y1 = value.bottom;
                
        var x2 = value.right;
        var y2 = value.top;
                
        var x3 = value.right;
        var y3 = value.bottom;
        
        if (value.slope_flip_x)
        {
            x1 = value.right;
            x2 = value.left;
            x3 = value.left;
        }
        
        if (value.slope_flip_y)
        {
            y1 = value.top;
            y2 = value.bottom;
            y3 = value.top;
        }
        
        draw_set_alpha(COLLIDER_SLOPE_ALPHA);
        draw_set_color(COLLIDER_SLOPE_COLOR);
        draw_triangle(x1, y1, x2, y2, x3, y3, false);
        
        draw_set_color(COLLIDER_SLOPE_OUTLINE);
        draw_triangle(x1, y1, x2, y2, x3, y3, true);
        
        return;
    }
    
    draw_set_alpha(COLLIDER_RECT_ALPHA);
    draw_set_color(COLLIDER_RECT_COLOR)
    draw_rectangle(value.left, value.top, value.right, value.bottom, false);
    
    draw_set_color(COLLIDER_RECT_OUTLINE);
    draw_rectangle(value.left, value.top, value.right, value.bottom, true);
});

draw_set_color(c_white);
draw_set_alpha(1);