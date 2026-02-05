event_inherited();

fade_alpha = 0.75;
fade_speed = 0.15;

global.clock.AddTickMethod(function() {
    fade_alpha -= fade_speed;
    if (fade_alpha <= 0)
        instance_destroy();
    
    
    image_alpha = (current_time % 2 > 0) ? fade_alpha * 1.5 : fade_alpha;
})

global.clock.VariableInterpolate("image_alpha", "iota_alpha");