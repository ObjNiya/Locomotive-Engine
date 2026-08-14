// TODO: Make usage of time sources and rewrite

/// @description This constructor will give a data structure that stores the value of the provided animation curves channel at it's seek position in the property ```value```; Which can be moved smoothly to a specified point.
/// @parameter {Asset.GMAnimCurve|Struct.AnimCurve} curve_struct_or_id The ID or struct pointer of the animation curve to target.
/// @parameter {String|Real} channel_name_or_index The channel name (a string) or the channel index (an integer).
/// @parameter {Real} duration How long it should take to move to the target X position on the animation curves channel.
/// @parameter {Constant.TimeSourceUnits} duration_units The unit that the given duration is in.
function Tween(curve_struct_or_id, channel_name_or_index, duration, duration_units = time_source_units_frames) constructor 
{
    animcurve = -1;
    animcurve_channel = -1;
    animcurve_out_channel = -1;
    
    speed_animcurve = -1;
    speed_animcurve_channel = -1;
    speed_animcurve_out_channel = -1;
    
    seek_start = 0;
    seek_target = 0;
    seek_position = 0;
    
    value = 0;
    time = 0;
    self.duration = 0;
    
    finished = true;
    finish_callback = function() { };
    finish_callback_arguments = [];
    
    if (variable_instance_exists(other, "id"))
        parent = other.id;
    else
        parent = -1;
    
    #region Animation curve setter functions
    
    /// @description This function will set which animation curve channel to get values off of, it will also get the value of the animation curve channel at the current seek position.
    /// @parameter {String|Real} channel_name_or_index The channel name (a string) or the channel index (an integer).
    static set_animcurve_channel = function(channel_name_or_index)
    {
        animcurve_channel = animcurve_get_channel(animcurve, channel_name_or_index);
        value = animcurve_channel_evaluate(animcurve_channel, seek_position);
    }
    
    /// @description This function will set which animation curve channel to get values off of when the seek target is below the seek position; In other words, when moving backwards.
    /// @parameter {String|Real} channel_name_or_index The channel name (a string) or the channel index (an integer).
    static set_animcurve_out_channel = function(channel_name_or_index)
    {
        animcurve_out_channel = animcurve_get_channel(animcurve, channel_name_or_index);
    }
    
    /// @description This function will set what animation curve to target when obtaining animation curve channels with ```set_animcurve_channel``` and ```set_animcurve_out_channel```. It will also set both channels to get values off of to the channel at index 0.
    /// @parameter {Asset.GMAnimCurve|Struct.AnimCurve} curve_struct_or_id The ID or struct pointer of the animation curve to target.
    static set_animcurve = function(curve_struct_or_id)
    {
        animcurve = (is_struct(curve_struct_or_id)) ? curve_struct_or_id : animcurve_get(curve_struct_or_id);
        
        set_animcurve_channel(0);
        set_animcurve_out_channel(0);
    }
    
    /// @description This function will set the animation curve to target and which channels to get values off of.
    /// @parameter {Asset.GMAnimCurve|Struct.AnimCurve} curve_struct_or_id The ID or struct pointer of the animation curve to target.
    /// @parameter {String|Real} channel_name_or_index The channel name (a string) or the channel index (an integer).
    /// @parameter {String|Real} channel_name_or_index_out The channel name (a string) or the channel index (an integer) for the out channel.
    static set_animcurve_ext = function(curve_struct_or_id, channel_name_or_index, channel_name_or_index_out)
    {
        set_animcurve(curve_struct_or_id);
        set_animcurve_channel(channel_name_or_index);
        set_animcurve_out_channel(channel_name_or_index_out);
    }
    
    #endregion
    
    #region Speed animation curve setter functions
    
    /// @description This function will set which animation curve channel to get the speed multiplier off of, the X position on the animation curve will be dictated by how far away the seek position is from the seek target.
    /// @parameter {String|Real} channel_name_or_index The channel name (a string) or the channel index (an integer).
    static set_speed_animcurve_channel = function(channel_name_or_index)
    {
        speed_animcurve_channel = animcurve_get_channel(speed_animcurve, channel_name_or_index);
    }
   
    /// @description This function will set which animation curve channel to get the speed multiplier off of, when the seek target is below the seek position; In other words, when moving backwards. the X position on the animation curve will be dictated by how far away the seek position is from the seek target.
    /// @parameter {String|Real} channel_name_or_index The channel name (a string) or the channel index (an integer).
    static set_speed_animcurve_out_channel = function(channel_name_or_index)
    {
        speed_animcurve_out_channel = animcurve_get_channel(speed_animcurve, channel_name_or_index);
    }

    /// @description This function will set an optional speed animation curve to target when obtaining animation curve channels with ```set_speed_animcurve_channel``` and ```set_speed_animcurve_out_channel```; Which will dictate the speed multiplier of the seeking on the base animation curve. It will also set both channels to get values off of to the channel at index 0.
    /// @parameter {Asset.GMAnimCurve|Struct.AnimCurve} curve_struct_or_id The ID or struct pointer of the animation curve to target.
    static set_speed_animcurve = function(curve_struct_or_id)
    {
        speed_animcurve = (is_struct(curve_struct_or_id)) ? curve_struct_or_id : animcurve_get(curve_struct_or_id);
        
        set_speed_animcurve_channel(0);
        set_speed_animcurve_out_channel(0);
    }
 
    /// @description This function will set the animation curve to target and which channels to get values off of for the speed multiplier.
    /// @parameter {Asset.GMAnimCurve|Struct.AnimCurve} curve_struct_or_id The ID or struct pointer of the animation curve to target.
    /// @parameter {String|Real} channel_name_or_index The channel name (a string) or the channel index (an integer).
    /// @parameter {String|Real} channel_name_or_index_out The channel name (a string) or the channel index (an integer) for the out channel.
    static set_speed_animcurve_ext = function(curve_struct_or_id, channel_name_or_index, channel_name_or_index_out)
    {
        set_speed_animcurve(curve_struct_or_id);
        set_speed_animcurve_channel(channel_name_or_index);
        set_speed_animcurve_out_channel(channel_name_or_index_out);
    }
    
    #endregion
    
    #region Seek setter functions
    
    /// @description This function will set the target position to seek to on the animation curve channels X position.
    /// @parameter {Real} seek_target The target X position in a range from 0 to 1.
    static set_seek_target = function(seek_target)
    {
        if (self.seek_target == seek_target)
            exit;
        
        time = 0;
        
        finished = false;
        
        seek_start = seek_position;
        self.seek_target = seek_target;
    }
    
    /// @description This function will set the target position to seek to on the animation curve channels X position as well as set the current seek position.
    /// @parameter {Real} seek_target The target X position in a range from 0 to 1.
    /// @parameter {Real} seek_position The seek position to snap to in a range from 0 to 1.
    static set_seek_target_ext = function(seek_position, seek_target)
    {
        self.seek_position = seek_position;
        
        set_seek_target(seek_target);
    }
    
    #endregion
    
    #region Misc. setter functions
    
    /// @description This function will set the duration of how long it should take to move to the target X position on the animation curves channel.
    /// @parameter {Real} duration How long it should take to move to the target X position on the animation curves channel.
    /// @parameter {Constant.TimeSourceUnits} duration_units The unit that the given duration is in.
    static set_duration = function(duration, duration_units = time_source_units_frames)
    {
        var multiplier = (duration_units == time_source_units_frames) ? 1 : game_get_speed(gamespeed_fps);
        
        self.duration = duration * multiplier;
    }
    
    /// @description This function will set a callback to be called in its bound context when the seek position has reached its target.
    /// @parameter {Function} finish_callback The function to be called.
    /// @parameter {Array<Any>} finish_callback_arguments The arguments to pass into the finish callback as an array.
    static set_finish_callback = function(finish_callback, finish_callback_arguments = [])
    {
        self.finish_callback = finish_callback;
        self.finish_callback_arguments = finish_callback_arguments;
    }
    
    #endregion
    
    /// @ignore
    static step = function()
    {
        var channel = animcurve_channel;
        var speed_channel = speed_animcurve_channel;
        
        if (seek_target < seek_position)
        {
            channel = animcurve_out_channel;
            speed_channel = speed_animcurve_out_channel;
        }
        
        var speed_animcurve_value = 1;
        
        if (speed_animcurve != -1 && speed_animcurve_channel != -1)
        {
            var seek_scalar = 0;
            var seek_target_subtracted = (seek_target - seek_start);
            
            if (seek_target_subtracted != 0)
                seek_scalar = (seek_position - seek_start) / seek_target_subtracted;
            
            speed_animcurve_value = animcurve_channel_evaluate(speed_channel, seek_scalar);
        }
        
        var sign_speed_animcurve_value = sign(speed_animcurve_value);
        
        if ((time >= duration && sign_speed_animcurve_value == 1) || (time <= 0 && sign_speed_animcurve_value == -1))  
        {
            if (!finished)
            {
                finished = true;
                method_call(finish_callback, finish_callback_arguments);
            }
            
            seek_position = seek_target;
            value = animcurve_channel_evaluate(animcurve_channel, seek_target);
            return;
        }
        
        seek_position = lerp(seek_start, seek_target, time / duration);
        value = animcurve_channel_evaluate(channel, seek_position);
        
        time += speed_animcurve_value;
    }
    
    set_animcurve_ext(curve_struct_or_id, channel_name_or_index, channel_name_or_index);
    set_duration(duration, duration_units);
    
    //array_push(obj_struct_updater.structs, self);
    //id = array_length(obj_struct_updater.structs);
}