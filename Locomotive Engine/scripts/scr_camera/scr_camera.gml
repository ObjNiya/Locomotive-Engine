enum CAM_LOCK
{
    OFF,
    PARTIAL,
    ON,
}

function Camera() constructor 
{
    viewport = array_length(global.cameras);
    
    followTarget = -1;
    followSpeed = 0;
    followSpeedType = 0;
    
    /////////
    // Axis
    ////////
    
    
    xAxis = new CameraAxis(followSpeed, followSpeedType);
    yAxis = new CameraAxis(followSpeed, followSpeedType);
    
    
    /**
     * Sets the cameras target to follow or point to.
     * @parameter {Id.Instance|Array<Real>} target_to_set The ID of the instance to follow **OR** a 2 entry long array with the first entry representing the x position to point to and the second entry representing the y position to point to.
     */
    TargetSet = function(target_to_set)
    {
        targetType = "none";
        followTarget = target_to_set;
        
        if (instance_exists(followTarget))
            targetType = "instance";
        else if (is_array(followTarget) && array_length(followTarget) >= 2 && is_real(followTarget[0]) && is_real(followTarget[1]))
            targetType = "point";
    }
    
    
    /**
     * How fast the camera can move to the instance it's following or the point it's pointing at.
     * @parameter {Real|Function|Asset.GMAnimCurve} target_speed The speed to set. If its a function, it should return a real. If it's an animation curve, it will use the normalized distance from the target position as the x position on the animation curve channel. If the speed is 0, the axis will instantly snap to its target position.
     * @parameter {Constant.AssetType} target_speed_type The type of the previously set speed. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever.
     */
    SpeedSet = function(target_speed, target_speed_type)
    {
        xAxis.SpeedSet(target_speed, target_speed_type);
        yAxis.SpeedSet(target_speed, target_speed_type);
    }
    
    
    /**
     * Sets how much the camera shakes away from the instance it's following or the point it's pointing at.
     * @parameter {Real} shake_magnitude How much the axis should shake.
     * @parameter {Real|Function|Asset.GMAnimCurve} shake_deceleration How fast the axis' shaking should decelerate to the minimum shaking. (The default minimum shaking is 0). If its a function, it should return a real. It will use the normalized distance from the minimum shaking as x position on the animation curve channel.
     * @parameter {Constant.AssetType} shake_deceleration_type The type of the previously set shaking celeration. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever.
     * @parameter {Real} deceleration_animcurve_channel (OPTIONAL) The index of which animation curve channel to use if the previously set shaking deceleration is an animation curve. Default is 0.
     * @parameter {Real} shake_priority (OPTIONAL) The priority over other `ShakeSet()` calls while the axis' shaking is above the minimum shaking. Default is 0.
     */
    ShakeSet = function(shake_magnitude, shake_deceleration, shake_deceleration_type, deceleration_animcurve_channel = 0, shake_priority = 0)
    {
        xAxis.ShakeSet(shake_magnitude, shake_deceleration, shake_deceleration_type, deceleration_animcurve_channel, shake_priority);
        yAxis.ShakeSet(shake_magnitude, shake_deceleration, shake_deceleration_type, deceleration_animcurve_channel, shake_priority);
    }
    
    
    /**
     * Sets the minimum of how much the camera shakes away from the instance it's following or the point it's pointing at.
     * @parameter {Real} shake_minimum (OPTIONAL) The minimum shake to set. Default is 0.
     */
    ShakeSetMin = function(shake_minimum = 0)
    {
        xAxis.ShakeSetMin(shake_minimum);
        yAxis.ShakeSetMin(shake_minimum);
    }
    
    
    /**
     * Sets the lock mode of the axis from the `CAM_LOCK` enum.
     * @parameter {Real} lock_mode The lock mode to set.
     */
    LockSet = function(lock_mode)
    {
        xAxis.LockSet(lock_mode);
        yAxis.LockSet(lock_mode);
    }
    
    
    /////////
    // Zoom
    ////////
    
    
    zoom = new ApproacherGroup();
    
    
    /**
     * Returns whether or not a zoom with the given name exists.
     * @parameter {String} zoom_name The name of the zoom to check for.
     * @pure
     */
    ZoomExists = function(zoom_name)
    {
        return zoom.Exists(zoom_name);
    }
    
    
    /**
     * Adds an zoom to the axis position that will increment to the given offset at the given speed.
     * @parameter {String} zoom_name The name of the zoom to add.
     * @parameter {Real|Function} zoom_target_pos The zooms target position. If its a function, it should return a real.
     * @parameter {Bool} zoom_target_pos_is_func Whether or not the zooms target position is a function or not.
     * @parameter {Real|Function|Asset.GMAnimCurve} zoom_speed The zooms speed. If its a function, it should return a real. If it's an animation curve, it will use the normalized distance from the target offset as the x position on the animation curve channel. If the speed is 0, the zoom will instantly snap to its target offset.
     * @parameter {Constant.AssetType} zoom_speed_type The type of the zooms previously set speed. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever.
     * @parameter {Real} zoom_speed_animcurve_channel (OPTIONAL) The index of which animation curve channel to use if the zooms speed is an animation curve. Default is 0.
     * @parameter {Real} zoom_priority (OPTIONAL) The priority of this zoom over others. If its priority is the same as others, their offsets will stack.
     * @returns {String}
     */
    ZoomAdd = function(zoom_name, zoom_target_pos, zoom_target_pos_is_func, zoom_speed, zoom_speed_type, zoom_speed_animcurve_channel = 0, zoom_priority = 0)
    {
        var zm = zoom.Add(zoom_name, zoom_target_pos, zoom_target_pos_is_func, zoom_speed, zoom_speed_type, zoom_speed_animcurve_channel, zoom_priority);
        zoom[$ zoom_name].pos = 1;
        
        return zm;
    }
    
    
    /**
     * Sets the given zooms speed at which it increments to the target offset.
     * @parameter {String} zoom_name The name of the zoom to set the speed of.
     * @parameter {Real|Function|Asset.GMAnimCurve} zoom_speed The speed to set. If its a function, it should return a real. If it's an animation curve, it will use the normalized distance from the target offset as the x position on the animation curve channel. If the speed is 0, the zoom will instantly snap to its target offset.
     * @parameter {Constant.AssetType} zoom_speed_type The type of the zooms previously set speed. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever.
     * @parameter {Real} zoom_speed_animcurve_channel (OPTIONAL) The index of which animation curve channel to use if the given speed is an animation curve. Default is 0.
     */
    ZoomSpeedSet = function(zoom_name, zoom_speed, zoom_speed_type, zoom_speed_animcurve_channel = 0)
    {
        zoom.SpeedSet(zoom_name, zoom_speed, zoom_speed_type, zoom_speed_animcurve_channel);
    }
    
    
    /**
     * Sets the given zooms offset to increment to.
     * @parameter {String} zoom_name The name of the zoom to set the offset of.
     * @parameter {Real|Function} zoom_target_pos The target offset to set. If its a function, it should return a real.
     * @parameter {Bool} zoom_target_pos_is_func Whether or not if the previously set target offset is a function.
     */
    ZoomTargetSet = function(zoom_name, zoom_target_pos, zoom_target_pos_is_func)
    {
        zoom.TargetSet(zoom_name, zoom_target_pos, zoom_target_pos_is_func);
    }
    
    
    /**
     * Sets the given zooms priority over other zooms.
     * @parameter {String} zoom_name The name of the zoom to set the priority of.
     * @parameter {Real} zoom_priority The priority to set. If its priority is the same as others, their offsets will stack.
     */
    ZoomPrioritySet = function(zoom_name, zoom_priority)
    {
        zoom.PrioritySet(zoom_name, zoom_priority);
    }
    
    /**
     * Removes the given zoom.
     * @parameter {String} zoom_name The name of the zoom to remove.
     * @returns {Bool}
     */
    ZoomRemove = function(zoom_name)
    {
        return zoom.Remove(zoom_name);
    }
    
    ////////
    // Angle
    ////////
    
    anglers = new ApproacherGroup();
    
    /**
     * Returns whether or not an angler with the given name exists.
     * @parameter {String} angler_name The name of the angler to check for.
     * @pure
     */
    AnglerExists = function(angler_name)
    {
        return anglers.Exists(angler_name);
    }
    
    
    /**
     * Adds an angler to the axis position that will increment to the given offset at the given speed.
     * @parameter {String} angler_name The name of the angler to add.
     * @parameter {Real|Function} angler_target_pos The anglers target position. If its a function, it should return a real.
     * @parameter {Bool} angler_target_pos_is_func Whether or not the anglers target position is a function or not.
     * @parameter {Real|Function|Asset.GMAnimCurve} angler_speed The anglers speed. If its a function, it should return a real. If it's an animation curve, it will use the normalized distance from the target offset as the x position on the animation curve channel. If the speed is 0, the angler will instantly snap to its target offset.
     * @parameter {Constant.AssetType} angler_speed_type The type of the anglers previously set speed. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever.
     * @parameter {Real} angler_speed_animcurve_channel (OPTIONAL) The index of which animation curve channel to use if the anglers speed is an animation curve. Default is 0.
     * @parameter {Real} angler_priority (OPTIONAL) The priority of this angler over others. If its priority is the same as others, their offsets will stack.
     * @returns {String}
     */ 
    AnglerAdd = function(angler_name, angler_target_pos, angler_target_pos_is_func, angler_speed, angler_speed_type, angler_speed_animcurve_channel = 0, angler_priority = 0)
    {
        return anglers.Add(angler_name, angler_target_pos, angler_target_pos_is_func, angler_speed, angler_speed_type, angler_speed_animcurve_channel, angler_priority);
    }
    
    
    /**
     * Sets the given anglers speed at which it increments to the target offset.
     * @parameter {String} angler_name The name of the angler to set the speed of.
     * @parameter {Real|Function|Asset.GMAnimCurve} angler_speed The speed to set. If its a function, it should return a real. If it's an animation curve, it will use the normalized distance from the target offset as the x position on the animation curve channel. If the speed is 0, the angler will instantly snap to its target offset.
     * @parameter {Constant.AssetType} angler_speed_type The type of the anglers previously set speed. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever.
     * @parameter {Real} angler_speed_animcurve_channel (OPTIONAL) The index of which animation curve channel to use if the given speed is an animation curve. Default is 0.
     */
    AnglerSpeedSet = function(angler_name, angler_speed, angler_speed_type, angler_speed_animcurve_channel = 0)
    {
        anglers.SpeedSet(angler_name, angler_speed, angler_speed_type, angler_speed_animcurve_channel);
    }
    
    
    /**
     * Sets the given anglers offset to increment to.
     * @parameter {String} angler_name The name of the angler to set the offset of.
     * @parameter {Real|Function} angler_target_pos The target offset to set. If its a function, it should return a real.
     * @parameter {Bool} angler_target_pos_is_func Whether or not if the previously set target offset is a function.
     */
    AnglerTargetSet = function(angler_name, angler_target_pos, angler_target_pos_is_func)
    {
        anglers.TargetSet(angler_name, angler_target_pos, angler_target_pos_is_func);
    }
    
    
    /**
     * Sets the given anglers priority over other anglers.
     * @parameter {String} angler_name The name of the angler to set the priority of.
     * @parameter {Real} angler_priority The priority to set. If its priority is the same as others, their offsets will stack.
     */
    AnglerPrioritySet = function(angler_name, angler_priority) 
    {
        anglers.PrioritySet(angler_name, angler_priority);
    }
    
    
    /**
     * Removes the given angler.
     * @parameter {String} angler_name The name of the angler to remove.
     * @returns {Bool}
     */
    AnglerRemove = function(angler_name)
    {
        return anglers.Remove(angler_name);
    }
    
    Step = function()
    {
        camId = view_camera[viewport];
        
        var zoom_amnt = 1;
    
        with (zoom)
        {
            Step();
            zoom_amnt = Evaluate(true);
        }
        
        var width = global.baseAppWidth / zoom_amnt;
        var height = global.baseAppHeight / zoom_amnt;
        
        camera_set_view_size(camId, width, height);
        
        var angle_amnt = 0;
        
        with (anglers)
        {
            Step();
            angle_amnt = Evaluate(false);
        }
        
        camera_set_view_angle(camId, angle_amnt);
        
        var target_x, target_y;
        
        switch (targetType)
        {
            case "instance":
                if (!instance_exists(followTarget))
                {
                    TargetSet("none");
                    break;
                }
                
                target_x = followTarget.x;
                target_y = followTarget.y;
                break;
            
            case "point":
                target_x = followTarget[0];
                target_y = followTarget[1];
                break;
            
            case "none":
                target_x = mouse_x;
                target_y = mouse_y;
                break;
        }
        
        var cam_center = width / 2;
        var cam_middle = height / 2;
        
        if (mouse_check_button(mb_middle) || targetType != "none")
        {
            xAxis.Step(target_x);
            yAxis.Step(target_y);
        }
        
        x = clamp(xAxis.pos - cam_center, 0, room_width - width);
        y = clamp(yAxis.pos - cam_middle, 0, room_height - height);
        
        with (fmodAttr.position)
        {
            x = other.x + cam_center;
            y = other.y + cam_middle;
        }
    
        camera_set_view_pos(camId, x, y);
        fmod_studio_system_set_listener_attributes(viewport, fmodAttr);
    }
    
    
    if (viewport > 7)
        exit;
    
    TargetSet(followTarget);
    fmod_studio_system_set_num_listeners(viewport);
    
    camId = view_camera[viewport];
    fmodAttr = new Fmod3DAttributes();
    
    with (fmodAttr)
    {
        forward.z = 1;
        up.y = 1; 
    }
    
    array_push(global.cameras, self);
} 

/**
 * Creates a camera if there are less than 7 cameras already present.
 * @parameter {Id.Instance|Array<Real>} follow_target (OPTIONAL) The ID of the instance to follow **OR** a 2 entry long array with the first entry representing the x position to point to and the second entry representing the y position to point to. Default is the current instances ID.
 * @parameter {Real|Function|Asset.GMAnimCurve} follow_speed (OPTIONAL) The speed to set. If its a function, it should return a real. If it's an animation curve, it will use the normalized distance from the target position as the x position on the animation curve channel. If the speed is 0, the axis will instantly snap to its target position. Default is 0.
 * @parameter {Constant.AssetType} follow_speed_type (OPTIONAL) The type of the previously set speed. If it's a function, this should be `asset_script`, if it's an animation curve, this should be `asset_animationcurve`. If it's a real, this can be whatever. Default is 0.
 */
function CameraCreate(follow_target = id, follow_speed = 0, follow_speed_type = 0)
{
    with (new Camera())
    {
        TargetSet(follow_target);
        SpeedSet(follow_speed, follow_speed_type);

        return self;
    }
}