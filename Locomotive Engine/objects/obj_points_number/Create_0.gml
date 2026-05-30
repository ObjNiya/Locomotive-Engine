vspeed = -3;
depth = DEPTHS.BACK;
visible = false;

flicker_timer = new Timer(5, time_source_units_frames, function() 
{
    visible = !visible;
    
    if (visible)
        flicker_timer.maxTime = 20;
    else
        flicker_timer.maxTime = 5;
});
flicker_timer.SetRepeating(false, true);
flicker_timer.Start();

number = 1;

call_later(0.9, time_source_units_seconds, function() {
    instance_destroy();
})