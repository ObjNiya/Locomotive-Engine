/**
 * Returns the angle of the current solids slope.
 */
function SolidSlopeCalcAngle()
{
    if (slopeXDir == 0 || slopeYDir == 0)
        return 0;

    var y1 = bbox_bottom;
    var y2 = bbox_top;
    
    if (slopeYDir == 1)
    {
        y1 = bbox_top;
        y2 = bbox_bottom;
    }
    
    return point_direction(bbox_left, y1, bbox_right, y2);
}

/**
 * Calculates the height of the current solids slope based on the other instances position relative to it.
 */
function SolidSlopeCalcHeight()
{
    var slope_bbox_top = bbox_top, slope_bbox_bottom = bbox_bottom;

    if (slopeXDir == 0 || slopeYDir == 0)
        return [slope_bbox_top, slope_bbox_bottom]; 
    
    var x_scalar;
    
    if (slopeXDir == 1)
        x_scalar = (bbox_right - other.bbox_right);
    else
        x_scalar = (other.bbox_left - bbox_left);
    
    x_scalar = 1 - (x_scalar / bboxWidth);
    x_scalar = clamp(x_scalar, 0, 1);
    
    if (slopeCurve != -1)
    {
       var curve_channel = animcurve_get_channel(slopeCurve, slopeCurveChannel);
       x_scalar = animcurve_channel_evaluate(curve_channel, x_scalar);
    }
    
    if (slopeYDir == -1)
        slope_bbox_top = lerp(bbox_bottom, bbox_top, x_scalar);
    else
        slope_bbox_bottom = lerp(bbox_top, bbox_bottom, x_scalar);
    
    slope_bbox_top = round(slope_bbox_top);
    slope_bbox_bottom = round(slope_bbox_bottom);
    
    return [slope_bbox_top, slope_bbox_bottom];
}