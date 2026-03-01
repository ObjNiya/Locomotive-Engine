image_alpha = approach(image_alpha, fade_target, fade_speed);

if (image_alpha == fade_target)
{
    if (--end_lag > 0 || finished)
        exit;
    
    finish_func();
    finished = true;
}