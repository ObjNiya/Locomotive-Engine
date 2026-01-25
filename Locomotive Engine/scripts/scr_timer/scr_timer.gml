function Timer(time, speed, units, callback) constructor
{
    max_time = time;
    self.units = units;
    self.callback = callback;
    self.speed = speed;
    
    self.time = 0;
    
    started = false;
    
    static start = function()
    { 
        time = max_time;
        started = true;
    }
    
    static stop = function()
    {
        started = false;
        time = 0;
    }
    
    static set_paused = function(paused)
    {
        started = paused;
    }
    
    static step = function()
    {
        if (!started)
            return;
        
        var divisor = (units == time_source_units_seconds) ? game_get_speed(gamespeed_fps) : 1;
        time -= speed / divisor;
        
        if (time <= 0)
        {
            callback();
            started = false;
        }
    }
    
    static get_seconds = function()
    {
        if (units == time_source_units_seconds)
            return round(time);
        
        return round(time / game_get_speed(gamespeed_fps));
    }
    
    static get_minutes = function()
    {
        return floor(get_seconds() / 60);
    }
    
    static get_time = function()
    {
        var minutes = get_minutes();
        var seconds = get_seconds() - (60 * minutes);
        
        if (seconds < 10)
            seconds = "0" + string(seconds);
        
        return string(minutes) + ":" + string(seconds);
    }
}