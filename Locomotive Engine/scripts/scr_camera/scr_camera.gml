enum CAM_LOCK
{
    OFF,
    PARTIAL,
    ON,
}


/// @ignore
function CameraAxis(speed, speed_type) constructor
{
    val = new Approacher();
    val.SpeedSet(speed, speed_type);
    
    pos = 0;
    
    lock = false;
    
    shake = new Approacher();
    shake.priority = -1;
    shake.targetPos = 0;
    
    offsetters = new ApproacherGroup();
    
    /**
     * Sets how fast the axis can follow its target position.
     * @parameter {Real|Function|Asset.GMAnimCurve} target_speed The speed to set. If its a function, it should return a real. If it's an animation curve, it will use the normalized distance from the target position as the x position on the animation curve channel. If the speed is 0, the axis will instantly snap to its target position.
     * @parameter {Constant.AssetType} target_speed_type The type of the previously set speed. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever.
     * @parameter {Real} target_speed_animcurve_channel (OPTIONAL) The index of which animation curve channel to use if the target speed is an animation curve. Default is 0.
     */
    static SpeedSet = function(target_speed, target_speed_type, target_speed_animcurve_channel = 0)
    {
        val.SpeedSet(target_speed, target_speed_type, target_speed_animcurve_channel);
    }
    
    
    /**
     * Returns whether or not an offsetter with the given name exists.
     * @parameter {String} offsetter_name The name of the offsetter to check for.
     * @pure
     */
    static OffsetterExists = function(offsetter_name)
    {
        return offsetters.Exists(offsetter_name);
    }
    
    
    /**
     * Adds an offsetter to the axis position that will increment to the given offset at the given speed.
     * @parameter {String} offsetter_name The name of the offsetter to add.
     * @parameter {Real|Function} offsetter_target_pos The offsetters target position. If its a function, it should return a real.
     * @parameter {Bool} offsetter_target_pos_is_func Whether or not the offsetters target position is a function or not.
     * @parameter {Real|Function|Asset.GMAnimCurve} offsetter_speed The offsetters speed. If its a function, it should return a real. If it's an animation curve, it will use the normalized distance from the target offset as the x position on the animation curve channel. If the speed is 0, the offsetter will instantly snap to its target offset.
     * @parameter {Constant.AssetType} offsetter_speed_type The type of the offsetters previously set speed. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever.
     * @parameter {Real} offsetter_speed_animcurve_channel (OPTIONAL) The index of which animation curve channel to use if the offsetters speed is an animation curve. Default is 0.
     * @parameter {Real} offsetter_priority (OPTIONAL) The priority of this offsetter over others. If its priority is the same as others, their offsets will stack.
     * @returns {String}
     */
    static OffsetterAdd = function(offsetter_name, offsetter_target_pos, offsetter_target_pos_is_func, offsetter_speed, offsetter_speed_type, offsetter_speed_animcurve_channel = 0, offsetter_priority = 0)
    {
        return offsetters.Add(offsetter_name, offsetter_target_pos, offsetter_target_pos_is_func, offsetter_speed, offsetter_speed_type, offsetter_speed_animcurve_channel, offsetter_priority);
    }
    
    
    /**
     * Sets the given offsetters speed at which it increments to the target offset.
     * @parameter {String} offsetter_name The name of the offsetter to set the speed of.
     * @parameter {Real|Function|Asset.GMAnimCurve} offsetter_speed The speed to set. If its a function, it should return a real. If it's an animation curve, it will use the normalized distance from the target offset as the x position on the animation curve channel. If the speed is 0, the offsetter will instantly snap to its target offset.
     * @parameter {Constant.AssetType} offsetter_speed_type The type of the offsetters previously set speed. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever.
     * @parameter {Real} offsetter_speed_animcurve_channel (OPTIONAL) The index of which animation curve channel to use if the given speed is an animation curve. Default is 0.
     */
    static OffsetterSpeedSet = function(offsetter_name, offsetter_speed, offsetter_speed_type, offsetter_speed_animcurve_channel = 0)
    {
        offsetters.SpeedSet(offsetter_name, offsetter_speed, offsetter_speed_type, offsetter_speed_animcurve_channel);
    }
    
    
    /**
     * Sets the given offsetters offset to increment to.
     * @parameter {String} offsetter_name The name of the offsetter to set the offset of.
     * @parameter {Real|Function} offsetter_target_pos The target offset to set. If its a function, it should return a real.
     * @parameter {Bool} offsetter_target_pos_is_func Whether or not if the previously set target offset is a function.
     */
    static OffsetterTargetSet = function(offsetter_name, offsetter_target_pos, offsetter_target_pos_is_func)
    {
        offsetters.TargetSet(offsetter_name, offsetter_target_pos, offsetter_target_pos_is_func);
    }
    
    
    /**
     * Sets the given offsetters priority over other offsetters.
     * @parameter {String} offsetter_name The name of the offsetter to set the priority of.
     * @parameter {Real} offsetter_priority The priority to set. If its priority is the same as others, their offsets will stack.
     */
    static OffsetterPrioritySet = function(offsetter_name, offsetter_priority) 
    {
        offsetters.PrioritySet(offsetter_name, offsetter_priority);
    }
    
    
    /**
     * Removes the given offsetter.
     * @parameter {String} offsetter_name The name of the offsetter to remove.
     * @returns {Bool}
     */
    static OffsetterRemove = function(offsetter_name)
    {
        return offsetters.Remove(offsetter_name);
    }
    
    
    /**
     * Sets how much the axis shakes away from its target position.
     * @parameter {Real} shake_magnitude How much the axis should shake.
     * @parameter {Real|Function|Asset.GMAnimCurve} shake_deceleration How fast the axis' shaking should decelerate to the minimum shaking. (The default minimum shaking is 0). If its a function, it should return a real. It will use the normalized distance from the minimum shaking as x position on the animation curve channel.
     * @parameter {Constant.AssetType} shake_deceleration_type The type of the previously set shaking celeration. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever.
     * @parameter {Real} deceleration_animcurve_channel (OPTIONAL) The index of which animation curve channel to use if the previously set shaking deceleration is an animation curve. Default is 0.
     * @parameter {Real} shake_priority (OPTIONAL) The priority over other `ShakeSet()` calls while the axis' shaking is above the minimum shaking. Default is 0.
     */
    static ShakeSet = function(shake_magnitude, shake_deceleration, shake_deceleration_type, deceleration_animcurve_channel = 0, shake_priority = 0)
    {
        if (shake.priority > shake_priority && shake.pos > 0)
            return false;
        
        shake.pos = shake_magnitude;
        shake.SpeedSet(shake_deceleration, shake_deceleration_type, deceleration_animcurve_channel);
        shake.priority = shake_priority;
    }
    
    
    /**
     * Sets the minimum of how much the axis shakes away from its target position.
     * @parameter {Real} shake_minimum (OPTIONAL) The minimum shake to set. Default is 0.
     */
    static ShakeSetMin = function(shake_minimum = 0)
    {
        shake.targetPos = shake_minimum;
    }
    
    
    /**
     * Sets the lock mode of the axis from the `CAM_LOCK` enum.
     * @parameter {Real} lock_mode The lock mode to set.
     */
    static LockSet = function(lock_mode)
    {
        lock = lock_mode;
    }
    
    /// @ignore
    static Step = function(target_pos)
    {
        shake.Step();
        offsetters.Step();
        
        var offsetter_pos = offsetters.Evaluate(false);
        var shake_mag = irandom_range(-shake.pos, shake.pos);
        
        val.targetPos = target_pos;
        if (lock == CAM_LOCK.OFF)
            val.Step();
        
        pos = val.pos + shake_mag + offsetter_pos;
    }
}


/**
 * Creates a camera if there are less than 7 cameras already present.
 * @parameter {Id.Instance|Array<Real>} follow_target (OPTIONAL) The ID of the instance to follow **OR** a 2 entry long array with the first entry representing the x position to point to and the second entry representing the y position to point to. Default is the current instances ID.
 * @parameter {Real|Function|Asset.GMAnimCurve} follow_speed (OPTIONAL) The speed to set. If its a function, it should return a real. If it's an animation curve, it will use the normalized distance from the target position as the x position on the animation curve channel. If the speed is 0, the axis will instantly snap to its target position. Default is 0.
 * @parameter {Constant.AssetType} follow_speed_type (OPTIONAL) The type of the previously set speed. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever. Default is 0.
 */
function CameraCreate(follow_target = id, follow_speed = 0, follow_speed_type = 0)
{
    with (InstanceCreate(0, 0, obj_camera))
    {
        followTarget = follow_target;
        followSpeed = follow_speed;
        followSpeedType = follow_speed_type;
        
        return id;
    }
}