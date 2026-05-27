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
    
    static SetCountdownMode = function(is_countdown_mode)
    {
        isCountdown = is_countdown_mode;
    }
    
    SetTickSpeed(1);
    SetFinishArguments([]);
    SetRepeating(false, false);
    SetCountdownMode(true);
    Stop();
    
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
    
    static GetMiliseconds = function()
    {
        if (timeUnits == time_source_units_seconds)
            return floor(curTime * 1000);
        
        return floor((curTime / game_get_speed(gamespeed_fps)) * 1000);
    }

    static GetSeconds = function()
    {
        return floor(GetMiliseconds() / 1000); 
    }
    
    static GetMinutes = function()
    {
        return floor(GetSeconds() / 60);
    }
    
    static GetHours = function()
    {
        return floor(GetMinutes() / 60);
    }
    
    static GetDays = function()
    {
        return floor(GetHours() / 24);
    }
    
    /// @ignore
    static __FormatTime__= function(time, length, sep_char = ":", is_start = false)
    {
        if (is_start && time == 0)
            return "";
        
        time = string(time);
        
        while (length > string_length(time) && !is_start && length > 0)
            time = string_insert("0", time, 1);
        
        return time + sep_char;
    }
    
    static GetTime = function()
    {
        var days = GetDays();
        var hours = GetHours();
        var minutes = GetMinutes();
        var seconds = GetSeconds();
        var centiseconds = GetMiliseconds();
        
        var days_txt = __FormatTime__(days, 0, ":", true);
        var hours_txt = __FormatTime__(hours - (24 * days), 2);
        var minutes_txt = __FormatTime__(minutes - (60 * hours), 2);
        var seconds_txt = __FormatTime__(seconds - (60 * minutes), 2, ".");
        var centiseconds_txt = __FormatTime__(centiseconds - (1000 * seconds), 3, "");
        
        return days_txt + hours_txt + minutes_txt + seconds_txt + centiseconds_txt;
    }
    
    static GetTimeCompact = function()
    {
        var minutes = GetMinutes();
        var seconds = GetSeconds();
        
        var minutes_txt = __FormatTime__(minutes, 1, ":", false);
        var seconds_txt = __FormatTime__(seconds - (60 * minutes), 2, "");
        
        return minutes_txt + seconds_txt;
    }
}