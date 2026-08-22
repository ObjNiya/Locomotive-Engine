/// @ignore
function Approacher() constructor 
{
    priority = 0;
    pos = 0;
    highestTargetPos = 0;
    
    targetPos = 0;
    targetPosIsFunc = false;
    
    spd = 0;
    spdType = 0;
    spdAcChannel = 0;
    
    /// @ignore
    static SpeedSet = function(target_speed, speed_type, target_speed_animcurve_channel = 0)
    {
        spd = target_speed;
        spdType = speed_type;
        spdAcChannel = target_speed_animcurve_channel;
    }
    
    /// @ignore
    static TargetSet = function(target_pos_to_set, target_pos_is_func)
    {
        targetPos = target_pos_to_set;
        targetPosIsFunc = target_pos_is_func;
    }
    
    /// @ignore
    static Step = function()
    {
        var actual_spd;
        var target_pos = (targetPosIsFunc) ? targetPos() : targetPos;
        
        if ((target_pos < highestTargetPos && sign(target_pos) == -1) || (target_pos > highestTargetPos && sign(target_pos) == 1))
            highestTargetPos = target_pos;

        switch (spdType)
        {
            case asset_animationcurve:
                actual_spd = animcurve_get_channel(spd, spdAcChannel);
                actual_spd = animcurve_channel_evaluate(actual_spd, pos / highestTargetPos);
                break;
            
            case asset_script:
                actual_spd = spd();
                break;
            
            default:
                actual_spd = spd;
                break;
        }
        
        if (actual_spd <= 0)
            pos = target_pos;
        else
            pos = pos + clamp(target_pos - pos, -actual_spd, actual_spd);
    }
}


/// @ignore
function ApproacherGroup() constructor
{
    /// @ignore
    static Exists = function(approacher_name)
    {
        return struct_exists(self, approacher_name);
    }
    
    
    /// @ignore
    static Add = function(approacher_name, approacher_target_pos, approacher_target_pos_is_func, approacher_speed, approacher_speed_type, approacher_speed_animcurve_channel = 0, approacher_priority = 0)
    {
        if (Exists(approacher_name))
            return -1;
        
        self[$ approacher_name] = new Approacher();
        
        with (self[$ approacher_name]) 
        {
            SpeedSet(approacher_speed, approacher_speed_type, approacher_speed_animcurve_channel);
            TargetSet(approacher_target_pos, approacher_target_pos_is_func);
            priority = approacher_priority;
        }
        
        return approacher_name;
    }
    
    
    /// @ignore
    static SpeedSet = function(approacher_name, approacher_speed, approacher_speed_type, approacher_speed_animcurve_channel = 0)
    {
        self[$ approacher_name].SpeedSet(approacher_speed, approacher_speed_type, approacher_speed_animcurve_channel);
    }
    
    
    /// @ignore
    static TargetSet = function(approacher_name,  approacher_target_pos, approacher_target_pos_is_func)
    {
        self[$ approacher_name].TargetSet(approacher_target_pos, approacher_target_pos_is_func);
    }
    
    
    /// @ignore
    static PrioritySet = function(approacher_name, approacher_priority)
    {
        self[$ approacher_name].priority = approacher_priority;
    }
    
    
    /// @ignore    
    static Remove = function(approacher_name)
    {
        if (!Exists(approacher_name))
            return false;
        
        struct_remove(self, approacher_name);
        return true;
    }
    
    
    /// @ignore
    static Step = function()
    {
        struct_foreach(self, function(name, approacher) {
            approacher.Step();
        });
    }
    
    /// @ignore
    static Evaluate = function(use_mult)
    {
        var approacher_prio = 0;
        var approacher_pos = (use_mult) ? 1 : 0;
        
        var approacher_arr = struct_get_names(self);
        var approacher_cnt = array_length(approacher_arr);
        
        var i = 0;
        repeat (approacher_cnt)
        {
            var approacher = self[$ approacher_arr[i]];
            if (!is_struct(approacher))
            {
                i++;
                continue;
            }
            
            var cur_pos = approacher.pos;
            var cur_prio = approacher.priority;
            
            if (cur_prio > approacher_prio)
            {
                approacher_pos = cur_pos;
                approacher_prio = cur_prio;
            }
            else if (cur_prio == approacher_prio)
            {
                if (!use_mult)
                    approacher_pos += cur_pos;
                else
                    approacher_pos *= cur_pos;
            }
            
            i++;
        }
        
        return approacher_pos;
    }
}