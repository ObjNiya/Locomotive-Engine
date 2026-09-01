enum CL_SIDES
{
    RIGHT = 1,
    BOTTOM = 2,
    LEFT = 3,
    TOP = 4,
}

enum PLATFORM_DIR
{
    NONE = -100,
    
    LEFT = -1,
    RIGHT = 1,
    UP = -2,
    DOWN = 2,
}


function SolidInRectangleArr(x1, y1, x2, y2, solid_obj_or_id = par_solid)
{
    var solid_arr = [];
    
    if (is_array(solid_obj_or_id))
    {
        var solid_count = array_length(solid_obj_or_id);
        var i = 0;
        
        repeat (solid_count)
        {
            var arr = SolidInRectangleArr(x1, y1, x2, y2, solid_obj_or_id[i]);
            array_copy(solid_arr, -1, arr, 0, -1);
            
            i++;
        }
        
        return noone;
    }
    
    with (solid_obj_or_id)
    {
        var dx1 = bbox_left;
        var dx2 = bbox_right;
        
        var slope_height = SolidSlopeCalcHeight();
        
        var dy1 = slope_height[0];
        var dy2 = slope_height[1];
        
        if (!__AABB__(x1, y1, x2, y2, dx1, dy1, dx2, dy2))
            continue;
        
        array_push(solid_arr, id);
    }
    
    return solid_arr;
}


function SolidInRectangle(x1, y1, x2, y2, solid_obj_or_id = par_solid)
{
    if (is_array(solid_obj_or_id))
    {
        var solid_count = array_length(solid_obj_or_id);
        var i = 0;
        
        repeat (solid_count)
        {
            var solid_id = SolidInRectangle(x1, y1, x2, y2, solid_obj_or_id[i]);
            if (solid_id != noone)
                return solid_id;
            
            i++;
        }
        
        return noone;
    }
    
    with (solid_obj_or_id)
    {
        var dx1 = bbox_left;
        var dx2 = bbox_right;
        
        var slope_height = SolidSlopeCalcHeight();
        
        var dy1 = slope_height[0];
        var dy2 = slope_height[1];
        
        if (!__AABB__(x1, y1, x2, y2, dx1, dy1, dx2, dy2))
            continue;
        
        return id;
    }
}


function SolidInPointArr(x, y, solid_obj_or_id = par_solid)
{
    return SolidInRectangleArr(x, y, x, y, solid_obj_or_id);
}


function SolidInPoint(x, y, solid_obj_or_id = par_solid)
{
    return SolidInRectangle(x, y, x, y, solid_obj_or_id);
}


function SolidMeetingArr(xx, yy, solid_obj_or_id = par_solid)
{
    var x_diff = xx - x, y_diff = yy - y;
    
    var x1 = bbox_left + x_diff, x2 = bbox_right + x_diff;
    var y1 = bbox_top + y_diff, y2 = bbox_bottom + y_diff;
    
    return SolidInRectangleArr(x1, y1, x2, y2, solid_obj_or_id);
}


function SolidMeeting(xx, yy, solid_obj_or_id = par_solid)
{
    var x_diff = xx - x, y_diff = yy - y;
    
    var x1 = bbox_left + x_diff, x2 = bbox_right + x_diff;
    var y1 = bbox_top + y_diff, y2 = bbox_bottom + y_diff;
    
    return SolidInRectangle(x1, y1, x2, y2, solid_obj_or_id);
}


function SolidCollideGetDir(solid_id)
{
    var x2 = bboxCenter, y2 = bboxMiddle;
    
    if (bboxCenter > solid_id.bboxCenter)
        x2 = bbox_left;
    else if (bboxCenter < solid_id.bboxCenter)
        x2 = bbox_right;
    
    return 360 - point_direction(solid_id.bboxCenter, solid_id.bboxMiddle, x2, y2);
}


function SolidCollideGetSide(solid_id)
{
    var dir = SolidCollideGetDir(solid_id);
    var sides = [];
    
    with (solid_id)
    {
        var top_right_c = 360 - point_direction(bboxCenter, bboxMiddle, bbox_right, bbox_top);
        var bottom_right_c = 360 - point_direction(bboxCenter, bboxMiddle, bbox_right, bbox_bottom);
        var bottom_left_c = 360 - point_direction(bboxCenter, bboxMiddle, bbox_left, bbox_bottom);
        var top_left_c = 360 - point_direction(bboxCenter, bboxMiddle, bbox_left, bbox_top);
  
        if ((dir <= bottom_right_c && dir >= 0) || (dir >= top_right_c && dir <= 0))
            array_push(sides, CL_SIDES.RIGHT);
        if (dir >= bottom_right_c && dir <= bottom_left_c)
            array_push(sides, CL_SIDES.BOTTOM);
        if (dir >= bottom_left_c && dir <= top_left_c)
            array_push(sides, CL_SIDES.LEFT);
        if (dir >= top_left_c && dir <= top_right_c)
            array_push(sides, CL_SIDES.TOP);
        
    } 
    
    if (array_length(sides) == 0)
        return -1;
    else
        return sides[0];
}

