array_foreach(global.colliders, function(value, index) {
    if (!value.active)
        return;
    
    if (value.is_slope)
    {
        var x1 = value.l;
        var y1 = value.b;
                
        var x2 = value.r;
        var y2 = value.t;
                
        var x3 = value.r;
        var y3 = value.b;
        
        if (value.slope_flip_x)
        {
            x1 = value.r;
            x2 = value.l;
            x3 = value.l;
        }
        
        if (value.slope_flip_y)
        {
            y1 = value.t;
            y2 = value.b;
            y3 = value.t;
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
    draw_rectangle(value.l, value.t, value.r, value.b, false);
    
    draw_set_color(COLLIDER_RECT_OUTLINE);
    draw_rectangle(value.l, value.t, value.r, value.b, true);
});

draw_set_color(c_white);
draw_set_alpha(1);