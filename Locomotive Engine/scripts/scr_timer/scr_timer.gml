/**
 * This function is a constructor and it will create a new Timer that can be used to trigger the given function with optional given arguments. 
 * The Timer contains the expected functions for starting it, stopping it and pausing it.
 * It also contains a function called ```set_ext```, which will allow you to configure its functionality further.
 * Lastly the Timer also has functions called ```get_seconds```, ```get_minutes``` and ```get_time``` which the first two return its remaining time in the 
 * named unit and the last function ```get_time``` returning a string that combines the result of ```get_minutes``` and ```get_seconds``` to be displayed 
 * in-game.
 * @parameter {Real} time The time the Timer starts counting down from when its active.
 * @parameter {Constant.TimeSourceUnits} time_units The unit measurement the ```time``` argument you previously defined is in.
 * @parameter {Function} func The function to run once the Timer has counted down to 0, it will run in the scope where it was defined in.
 * @parameter {Array<Any>} function_arguments (OPTIONAL) The arguments to pass into your previously defined function that runs when the Timer has counted down to 0 as an array.
 */
function Timer(time, time_units, func, function_arguments = []) constructor
{
    // User properties
    
    max_time = time;
    self.time = 0;
    self.time_units = time_units;
    tick_speed = 1;
    
    repeating = false;
    
    self.func = func;
    self.function_arguments = function_arguments;
    
    // Other properties
    
    active = false;
    paused = false;
    
    if (variable_instance_exists(other, "id"))
        parent = other.id;
    else
        parent = -1;
    
    /**
     * This function will let you configure the functionality of your Timer, letting you set the tick speed of the Timer and whether it should repeat when it 
     * has counted down to 0.
     * @parameter {Real} tick_speed The tick speed of the Timer, in other words, the speed multiplier of the Timer.
     * @parameter {Bool} repeating Whether to restart the Timer once it has reached 0 and count down again.
     */
    static set_ext = function(tick_speed, repeating)
    {
        self.tick_speed = tick_speed;
        self.repeating = repeating;
        
        if (time_units == time_source_units_seconds)
            self.tick_speed /= game_get_speed(gamespeed_fps);
    }
    
    set_ext(tick_speed, repeating);
    
    /**
     * This function will make the Timer start counting down if it isn't active already from the time you defined when creating it.
     */
    static start = function()
    {
        if (!active)
        {
            time = max_time;
            active = true;
        }
    }
    
    /**
     * This function will make the Timer stop if its active, not calling the function you defined when creating it.
     */
    static stop = function()
    {
        if (active)
        {
            time = 0;    
            active = false;
        }
    }
    
    /**
     * This function will make the Timer pause or unpause based on the given argument. If you pause it, its time will remain in place until unpaused.
     * @parameter {Bool} paused Whether to pause the Timer or not.
     */
    static set_paused = function(paused)
    {
        self.paused = paused;
    }
    
    /// @ignore
    static step = function()
    {
        if (!active || paused)
            return;
        
        time -= tick_speed;
        
        if (time > 0)
            return;
        
        method_call(func, function_arguments);
        active = false;
        
        if (repeating)
            start();
    }
    
    /**
     * This function will return the seconds the Timer has left until it reaches 0 and finishes.
     * @returns {Real}
     * @pure
     */
    static get_seconds = function()
    {
        if (time_units == time_source_units_seconds)
            return round(time);
        
        return round(time / game_get_speed(gamespeed_fps));
    }
    
    /**
     * This function will return the minutes the Timer has left until it reaches 0 and finishes.
     * @returns {Real}
     * @pure
     */
    static get_minutes = function()
    {
        return floor(get_seconds() / 60);
    }
    
    /**
     * This function will return the minutes and seconds the Timer has left until it reaches 0 and finishes formatted together into a string.
     * (Example: 1:38)
     * @returns {String}
     * @pure
     */
    static get_time = function()
    {
        var minutes = get_minutes();
        var seconds = get_seconds() - (60 * minutes);
        
        if (seconds < 10)
            seconds = "0" + string(seconds);
        
        return string(minutes) + ":" + string(seconds);
    }

    array_push(obj_struct_updater.structs, self);
    id = array_length(obj_struct_updater.structs);
}

enum TIMER_STATES
{
    STARTED = 0,
    PAUSED = 1,
    STOPPED = 2,
    FINISHED = 3,
}

function NewTimer(max_time, time_units, finish_function) constructor
{
    maxTime = max_time;
    timeUnits = time_units;
    finishFunc = finish_function;
    isCountdown = true;
    tickFuncs = [];
    pointFuncs = [];
    
    
    ///////////////////
    // Setter functions
    ///////////////////
    
    
    static AddTickFunction = function(tick_function, tick_function_interval, tick_function_arguments = [])
    {
        array_push(tickFuncs, [tick_function, tick_function_interval, tick_function_arguments]);
    }
    
    
    static AddPointFunction = function(point_function, point_function_trigger_point, point_function_arguments = [])
    {
        array_push(pointFuncs, [point_function, point_function_trigger_point, point_function_arguments, false]);
    }
    
    
    static SetFinishArguments = function(arguments)
    {
        finishFuncArgs = arguments;
    }
    
    
    static SetTickSpeed = function(tick_speed)
    {
        tickSpeed = tick_speed;
        
        if (timeUnits == time_source_units_seconds)
            tickSpeed /= game_get_speed(gamespeed_fps);
    }
    
    
    static SetRepeating = function(repeat_finish_function, repeat_timer)
    {
        repeatFinish = repeat_finish_function;
        repeatTimer = repeat_timer;
    }
    
    
    static SetCountdownMode = function(is_countdown_mode)
    {
        isCountdown = is_countdown_mode;
    }
    
    
    ///////////////////
    // Getter functions
    ///////////////////
    
    
    static GetMiliseconds = function()
    {
        var time = curTime * 1000;
        
        if (timeUnits != time_source_units_seconds)
            time /= game_get_speed(gamespeed_fps);
        
        return floor(time);
    }
    
    static GetCentiseconds = function()
    {
        return floor(GetMiliseconds() / 10);
    }
    
    static GetDeciseconds = function()
    {
        return floor(GetMiliseconds() / 100);
    }
    
    
    static GetSeconds = function()
    {
        return floor(GetMiliseconds() / 1000);
    }
    
    
    static GetMinutes = function()
    {
        return floor(GetMiliseconds() / 60000);
    }

    
    static GetHours = function()
    {
        return floor(GetMiliseconds() / 3600000);
    }
    
    
    static GetTimeArray = function(subsecond_precision)
    {
        var smh = [GetHours(), GetMinutes(), GetSeconds()];
        var i = 0;
        
        repeat (3)
        {
            if (i - 1 >= 0)
                smh[i] -= 60 * smh[i - 1];
            i++;
        }
        
        if (subsecond_precision <= 0)
            return smh;
        
        subsecond_precision--;
        
        var dcm = [GetDeciseconds(), GetCentiseconds(), GetMiliseconds()];
        var dcm_mults = [10, 100, 1000];
        var time = dcm[subsecond_precision] - (dcm_mults[subsecond_precision] * GetSeconds());
        
        array_push(smh, time);
        return smh;
    }

    
    ///////////////////
    // Active functions
    ///////////////////
    
    
    static Start = function()
    {
        state = TIMER_STATES.STARTED;
        curTime = maxTime * real(isCountdown);
        
        array_foreach(pointFuncs, function(p_func, index) {
            p_func[3] = false;
        });
    }
    
    
    static Stop = function()
    {
        state = TIMER_STATES.STOPPED;
        curTime = maxTime * real(!isCountdown);
    }
    
    
    static TogglePause = function()
    {
        if (state == TIMER_STATES.STARTED)
            state = TIMER_STATES.PAUSED;
        else if (state == TIMER_STATES.PAUSED)
            state = TIMER_STATES.STARTED;
    }
    
    
    static Step = function()
    {
        if (state != TIMER_STATES.STARTED)
        {
            if (state == TIMER_STATES.FINISHED && repeatFinish)
                method_call(finishFunc, finishFuncArgs);
            return;
        }
        
        if ((isCountdown && curTime > 0) || (!isCountdown && curTime < maxTime))
        {
            curTime += (isCountdown) ? -tickSpeed : tickSpeed;
            
            var tick_func_count = array_length(tickFuncs);
            var i = 0;
            
            repeat (tick_func_count)
            {
                if (curTime % tickFuncs[i][1] == 0)
                    method_call(tickFuncs[i][0], tickFuncs[i][2]);
                
                i++;
            }
            
            var point_func_count = array_length(pointFuncs);
            i = 0;
            
            repeat (point_func_count)
            {
                if (((curTime <= pointFuncs[i][1] && isCountdown) || (curTime >= pointFuncs[i][1] && !isCountdown)) && !pointFuncs[i][3]) 
                {
                    method_call(pointFuncs[i][0], pointFuncs[i][2]);
                    pointFuncs[i][3] = true;
                }
                
                i++;
            }
            
            return;
        }
        
        state = TIMER_STATES.FINISHED;
        method_call(finishFunc, finishFuncArgs);
        
        if (repeatTimer)
            Start();
    }
    
    
    static __DrawPrepareTxt__ = function(length, short_start, subsecond_precision)
    {
        var time_array = GetTimeArray(subsecond_precision);
        var time_length = array_length(time_array) - 1;
        
        length = clamp(length, 0, time_length);
        
        var start = time_length - length;
        var i = start;
        
        repeat (length + 1)
        {
            var min_length = 1;
            if (short_start && i == start)
            {
                
                min_length = 0;
            }
            else if (i == 3)
            {
                
                min_length = subsecond_precision;
            }
            
            var padding_0s = "";
            time_array[i] = string(time_array[i]);
            
            while (string_length(time_array[i]) < min_length) 
            {
                padding_0s += "0";
                time_array[i] = padding_0s + time_array[i];
            }
            
            if (i == 2 && time_length >= 3)
                time_array[i] += ".";
            else if (i != 3)
                time_array[i] += ":";
            i++;
        }
        
        quick_log([time_array])
        return time_array;
    }
    
    
    static DrawTransformedColor = function(x, y, xscale, yscale, angle, c1, c2, c3, c4, alpha, subsecond_precision, length, short_start = true)
    {
        var align = draw_get_halign();
        var time_arr_str = __DrawPrepareTxt__(length, short_start, subsecond_precision);
        
        if (align == fa_center)
        {
            draw_text_transformed_color(x, y, string_concat_ext(time_arr_str), xscale, yscale, angle, c1, c2, c3, c4, alpha);
            return;
        }
        
        var time_length = array_length(time_arr_str);
        var i = (align == fa_right) ? time_length - 1 : 0; 
        var x_offset = 0;
        
        repeat (time_length)
        {
            var time_txt = time_arr_str[i];
            
            draw_text_transformed_color(x + x_offset, y, time_txt, xscale, yscale, angle, c1, c2, c3, c4, alpha);
            
            if (align == fa_right)
            {
                x_offset -= string_width(time_txt);
                i--;
            }
            else
            { 
                x_offset += string_width(time_txt);
                i++;
            }
        }
    }
    
    
    static DrawTransformed = function(x, y, xscale, yscale, angle, subsecond_precision, length, short_start = true)
    {
        var color = draw_get_color();
        var alpha = draw_get_alpha();
        
        DrawTransformedColor(x, y, xscale, yscale, angle, color, color, color, color, alpha, subsecond_precision, length, short_start);
    }
    
    
    static DrawColor = function(x, y, c1, c2, c3, c4, alpha, subsecond_precision, length, short_start = true)
    {
        DrawTransformedColor(x, y, 1, 1, 0, c1, c2, c3, c4, alpha, subsecond_precision, length, short_start);
    }
    
    
    static Draw = function(x, y, subsecond_precision, length, short_start = true)
    {
        DrawTransformed(x, y, 1, 1, 0, subsecond_precision, length, short_start);
    }
    
    SetTickSpeed(1);
    SetFinishArguments([]);
    SetRepeating(false, false);
    SetCountdownMode(true);
    Stop();
}

function TimerFire(max_time, time_units, finish_function)
{
    var timer = new NewTimer(max_time, time_units, finish_function);
    timer.Start();
}