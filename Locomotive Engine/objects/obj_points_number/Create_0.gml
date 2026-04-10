vspeed = -3;
depth = DEPTHS.BACK;
visible = false;

flicker_timer = new Timer(5, time_source_units_frames, function() 
{
    visible = !visible;
    
    if (visible)
        flicker_timer.max_time = 20;
    else
        flicker_timer.max_time = 5;
});
flicker_timer.set_ext(1, true);
flicker_timer.start();

number = 1;

call_later(0.9, time_source_units_seconds, function() {
    instance_destroy();
})