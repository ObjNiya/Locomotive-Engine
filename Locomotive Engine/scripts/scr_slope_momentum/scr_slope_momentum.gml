#macro SLOPE_ACCEL_ANG_MAX 45

/**
 * Calculates aceleration and deceleration based on the slopes angle the current instance is standing on.
 * @parameter {Real} decel_min The minimum deceleration when the current instance is going uphill.
 * @parameter {Real} decel_max The maximum deceleration when the current instance is going uphill.
 * @parameter {Real} acel_min The minimum aceleration when the current instance is going downhill.
 * @parameter {Real} acel_max The maximum aceleration when the current instance is going downhill.
 */
function CalcSlopeAccel(acel_min, acel_max, decel_min, decel_max)
{
    if (!groundedSlope)
        return 0;
    
    with (instance_place(x, y + 1, [obj_slope, obj_slopePlatform]))
    {
        var slope_ang = point_direction(bbox_left, bbox_bottom, bbox_right, bbox_top);
        var angle_scalar = clamp(slope_ang / SLOPE_ACCEL_ANG_MAX, 0, 1);
        
        var other_dir = sign(other.hsp);
        var dir = sign(image_xscale);
        
        if (other_dir == dir)
            return -lerp(decel_min, decel_max, angle_scalar);
        else
            return lerp(acel_min, acel_max, angle_scalar);
    }
    
    return 0;
}