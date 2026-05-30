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

/**
 * This constructor is an extensive timer that will tick down or up to the given seconds or frames and call a given function once it has reached its goal.
 * @parameter {Real} max_time The time to reach or tick down from in seconds or frames.
 * @parameter {Constant.TimeSourceUnits} time_units In which time unit time is supposed to pass. (seconds or frames)
 * @parameter {Function} finish_function The function to call once the timer has reached its goal, it will be called within its bound context.
 */
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
    
    
    /**
     * This function will set an optional array of arguments to be passed into the finish function when it's called.
     * @parameter {Array<Any>} arguments The array of arguments to pass into the finish function.
     */
    static SetFinishArguments = function(arguments)
    {
        finishFuncArgs = arguments;
    }
    
    
    /**
     * This function will set by how much to tick up or down the timer every frame or second.
     * @parameter {Real} tick_speed At which tick speed the timer is supposed to run.
     */
    static SetTickSpeed = function(tick_speed)
    {
        tickSpeed = tick_speed;
        
        if (timeUnits == time_source_units_seconds)
            tickSpeed /= game_get_speed(gamespeed_fps);
    }
    
    
    /**
     * This function will let you toggle whether or not the timer should restart when it reaches its goal or if it should repeat the finish function every frame when
     * it has reached its goal.
     * @parameter {Bool} repeat_finish_function Whether or not to repeat the finish function every frame once the timer has reached its goal.
     * @parameter {Bool} repeat_timer Whether or not to restart the timer once it has reached its goal.
     */
    static SetRepeating = function(repeat_finish_function, repeat_timer)
    {
        repeatFinish = repeat_finish_function;
        repeatTimer = repeat_timer;
    }
    
    /**
     * This function will let you toggle the countdown mode. 
     * When it's on, the timer will count down from the given maximum time and finish when it reaches 0.
     * When it's off, the timer will start from 0, count up and finish when it reaches the given maximum time.
     * @parameter {Bool} is_countdown_mode Whether or not to enable countdown mode.
     */
    static SetCountdownMode = function(is_countdown_mode)
    {
        isCountdown = is_countdown_mode;
    }
    
    
    /**
     * This function will add a function to be called at a given tick interval.
     * @parameter {Function} tick_function The function to call at the given tick interval, it will be called within its bound context.
     * @parameter {Real} tick_function_interval At which tick interval the function will be called at. Example: ```1 = every tick, 2 = every other tick```
     * @parameter {Array<Any>} tick_function_arguments Which arguments to pass into the tick function when it's called.
     * @returns {Real}
     */
    static AddTickFunction = function(tick_function, tick_function_interval, tick_function_arguments = [])
    {
        array_push(tickFuncs, [tick_function, tick_function_interval, tick_function_arguments]);
        return array_length(tickFuncs) - 1;
    }
    
    
    /**
     * This function will add a function to be called once the timers time has reached the given time point.
     * @parameter {Function} point_function The function to call at the given time point, it will be called within its bound context.
     * @parameter {Real} point_function_trigger_point At which tick to call the function at.
     * @parameter {Array<Any>} point_function_arguments Which arguments to pass into the point function when it's called.
     */
    static AddPointFunction = function(point_function, point_function_trigger_point, point_function_arguments = [])
    {
        array_push(pointFuncs, [point_function, point_function_trigger_point, point_function_arguments, false]);
    }
    

    ///////////////////
    // Getter functions
    ///////////////////
    
    
    /**
     * This function will return the time the timer is currently at in miliseconds.
     * @returns {Real}
     * @pure
     */
    static GetMiliseconds = function()
    {
        var time = curTime * 1000;
        
        if (timeUnits != time_source_units_seconds)
            time /= game_get_speed(gamespeed_fps);
        
        return floor(time);
    }
    
    
    /**
     * This function will return the time the timer is currently at in centiseconds.
     * @returns {Real}
     * @pure
     */
    static GetCentiseconds = function()
    {
        return floor(GetMiliseconds() / 10);
    }
    
    
    /**
     * This function will return the time the timer is currently at in deciseconds.
     * @returns {Real}
     * @pure
     */
    static GetDeciseconds = function()
    {
        return floor(GetMiliseconds() / 100);
    }
    
    
    /**
     * This function will return the time the timer is currently at in seconds.
     * @returns {Real}
     * @pure
     */
    static GetSeconds = function()
    {
        return floor(GetMiliseconds() / 1000);
    }
    
    
    /**
     * This function will return the time the timer is currently at in minutes.
     * @returns {Real}
     * @pure
     */
    static GetMinutes = function()
    {
        return floor(GetMiliseconds() / 60000);
    }

    
    /**
     * This function will return the time the timer is currently at in hours.
     * @returns {Real}
     * @pure
     */    
    static GetHours = function()
    {
        return floor(GetMiliseconds() / 3600000);
    }
    
    
    /**
     * This function will return the current time the timer is at in hours, minutes, seconds and subseconds.
     * @parameter {Real} length In how many unique units to display the timers current time in. ```1 = seconds, 2 = minutes:seconds, 3 = hours:minutes:seconds```
     * @parameter {Real} subsecond_precision Which time unit to use for subseconds. ```3 = miliseconds, 2 = centiseconds, 1 = deciseconds, 0 = none/don't add```
     * @returns {Array<Real>}
     * @pure
     */
    static GetTimeArray = function(length, subsecond_precision)
    {
        var smh = [GetHours(), GetMinutes(), GetSeconds()];
        var start = 2 - length;
        var i = start
        
        repeat (length + 1)
        {
            if (i - 1 > start)
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
    
    
    /**
     * This function will start the timer and will make it start ticking towards its goal.
     */
    static Start = function()
    {
        state = TIMER_STATES.STARTED;
        curTime = maxTime * real(isCountdown);
        
        array_foreach(pointFuncs, function(p_func, index) {
            p_func[3] = false;
        });
    }

    
    /**
     * This function will stop the timer and reset its time back to the start.
     */
    static Stop = function()
    {
        state = TIMER_STATES.STOPPED;
        curTime = maxTime * real(!isCountdown);
    }
    
    
    /**
     * This function will toggle if the timer should be paused or not automatically based on if it's already paused or not.
     */
    static TogglePause = function()
    {
        if (state == TIMER_STATES.STARTED)
            state = TIMER_STATES.PAUSED;
        else if (state == TIMER_STATES.PAUSED)
            state = TIMER_STATES.STARTED;
    }
    
    /**
     * This function is to be called in the Step event of your object, it will make the timer tick towards its goal and call the tick-, point- and finish functions.
     */
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
    
    
    /// @ignore
    static __DrawPrepareTxt__ = function(length, short_start, subsecond_precision)
    {
        var time_array = GetTimeArray(length, subsecond_precision);
        var time_length = array_length(time_array) - 1;
        
        length = clamp(length, 0, time_length);
        
        var start = time_length - length;
        var i = start;
        
        repeat (length + 1)
        {
            var min_length = 2;
            if (short_start && i == start)
                min_length = 1;
            else if (i == 3)
                min_length = subsecond_precision;
            
            time_array[i] = string(time_array[i]);
            
            var padding_0s = "";
            var padding_to_add = min_length - string_length(time_array[i]);
            if (padding_to_add < 0)
                padding_to_add = 0;
            
            repeat (padding_to_add)
                padding_0s += "0";
            
            time_array[i] = padding_0s + time_array[i];
            
            if (i == 2 && time_length >= 3)
                time_array[i] += ".";
            else if (i != 3) 
                time_array[i] += ":";
            i++;
        }
        
        i = start - 1;
        
        repeat (start)
        {
            array_delete(time_array, i, 1);
            i--;
        }
        
        return time_array;
    }
    
    
    /**
     * This function will draw the current time of the timer with the given transformations and gradients, formatted for UI's and such. Example: ```0:04:35.573```
     * @parameter {Real} x The x coordinate of the drawn timer.
     * @parameter {Real} y The y coordinate of the drawn timer.
     * @parameter {Real} xscale The horizontal scale (default 1).
     * @parameter {Real} yscale The vertical scale (default 1).
     * @parameter {Real} angle The angle of the timer.
     * @parameter {Constant.Color} c1 The colour for the top left of the drawn timer.
     * @parameter {Constant.Color} c2 The colour for the top right of the drawn timer.
     * @parameter {Constant.Color} c3 The colour for the bottom right of the drawn timer.
     * @parameter {Constant.Color} c4 The colour for the bottom left of the drawn timer.
     * @parameter {Real} alpha The alpha for the timer.
     * @parameter {Real} subsecond_precision Which time unit to use for subseconds. ```3 = miliseconds, 2 = centiseconds, 1 = deciseconds, 0 = none/don't add```
     * @parameter {Real} length In how many unique units to display the timers current time in. ```1 = seconds, 2 = minutes:seconds, 3 = hours:minutes:seconds```
     * @parameter {Bool} short_start Whether or not to only add one padding 0 to the largest unit of the drawn timer.
     * @returns {String}
     */
    static DrawTransformedColor = function(x, y, xscale, yscale, angle, c1, c2, c3, c4, alpha, subsecond_precision, length, short_start = true)
    {
        var align = draw_get_halign();
        var time_arr_str = __DrawPrepareTxt__(length, short_start, subsecond_precision);
        var time_str = string_concat_ext(time_arr_str);
        
        if (align == fa_center)
        {
            draw_text_transformed_color(x, y, time_str, xscale, yscale, angle, c1, c2, c3, c4, alpha);
            return time_str;
        }
        
        var time_length = array_length(time_arr_str);
        var i = (align == fa_right) ? time_length - 1 : 0; 
        
        var x_offset = 0;
        var y_offset = 0;
        
        repeat (time_length)
        {
            var time_txt = time_arr_str[i];
       
            draw_text_transformed_color(x + x_offset, y + y_offset, time_txt, xscale, yscale, angle, c1, c2, c3, c4, alpha);
            
            var x_off_to_add = lengthdir_x(string_width(time_txt) * xscale, angle);
            var y_off_to_add = lengthdir_y(string_width(time_txt) * xscale, angle);

            if (align == fa_right)
            {
                x_offset -= x_off_to_add;
                y_offset -= y_off_to_add;
                
                i--;
            }
            else
            { 
                x_offset += x_off_to_add;
                y_offset += y_off_to_add;
                
                i++;
            }
        }
        
        return time_str;
    }
    
    
    /**
     * This function will draw the current time of the timer with the given transformations, formatted for UI's and such. Example: ```0:04:35.573```
     * @parameter {Real} x The x coordinate of the drawn timer.
     * @parameter {Real} y The y coordinate of the drawn timer.
     * @parameter {Real} xscale The horizontal scale (default 1).
     * @parameter {Real} yscale The vertical scale (default 1).
     * @parameter {Real} angle The angle of the timer.
     * @parameter {Real} subsecond_precision Which time unit to use for subseconds. ```3 = miliseconds, 2 = centiseconds, 1 = deciseconds, 0 = none/don't add```
     * @parameter {Real} length In how many unique units to display the timers current time in. ```1 = seconds, 2 = minutes:seconds, 3 = hours:minutes:seconds```
     * @parameter {Bool} short_start Whether or not to only add one padding 0 to the largest unit of the drawn timer.
     * @returns {String}
     */
    static DrawTransformed = function(x, y, xscale, yscale, angle, subsecond_precision, length, short_start = true)
    {
        var color = draw_get_color();
        var alpha = draw_get_alpha();
        
        return DrawTransformedColor(x, y, xscale, yscale, angle, color, color, color, color, alpha, subsecond_precision, length, short_start);
    }
    
    
    /**
     * This function will draw the current time of the timer with the given color gradient, formatted for UI's and such. Example: ```0:04:35.573```
     * @parameter {Real} x The x coordinate of the drawn timer.
     * @parameter {Real} y The y coordinate of the drawn timer.
     * @parameter {Constant.Color} c1 The colour for the top left of the drawn timer.
     * @parameter {Constant.Color} c2 The colour for the top right of the drawn timer.
     * @parameter {Constant.Color} c3 The colour for the bottom right of the drawn timer.
     * @parameter {Constant.Color} c4 The colour for the bottom left of the drawn timer.
     * @parameter {Real} alpha The alpha for the timer.
     * @parameter {Real} subsecond_precision Which time unit to use for subseconds. ```3 = miliseconds, 2 = centiseconds, 1 = deciseconds, 0 = none/don't add```
     * @parameter {Real} length In how many unique units to display the timers current time in. ```1 = seconds, 2 = minutes:seconds, 3 = hours:minutes:seconds```
     * @parameter {Bool} short_start Whether or not to only add one padding 0 to the largest unit of the drawn timer.
     * @returns {String}
     */
    static DrawColor = function(x, y, c1, c2, c3, c4, alpha, subsecond_precision, length, short_start = true)
    {
        return DrawTransformedColor(x, y, 1, 1, 0, c1, c2, c3, c4, alpha, subsecond_precision, length, short_start);
    }
    
    
    /**
     * This function will draw the current time of the timer, formatted for UI's and such. Example: ```0:04:35.573```
     * @parameter {Real} x The x coordinate of the drawn timer.
     * @parameter {Real} y The y coordinate of the drawn timer.
     * @parameter {Real} subsecond_precision Which time unit to use for subseconds. ```3 = miliseconds, 2 = centiseconds, 1 = deciseconds, 0 = none/don't add```
     * @parameter {Real} length In how many unique units to display the timers current time in. ```1 = seconds, 2 = minutes:seconds, 3 = hours:minutes:seconds```
     * @parameter {Bool} short_start Whether or not to only add one padding 0 to the largest unit of the drawn timer.
     * @returns {String}
     */
    static Draw = function(x, y, subsecond_precision, length, short_start = true)
    {
        return DrawTransformed(x, y, 1, 1, 0, subsecond_precision, length, short_start);
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