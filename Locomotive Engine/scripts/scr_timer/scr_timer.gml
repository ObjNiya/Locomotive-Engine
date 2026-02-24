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