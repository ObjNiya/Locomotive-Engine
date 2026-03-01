fade_alpha = approach(fade_alpha, real(fade_out), 0.03);

if (splash_index == -1)
{
    if (fade_alpha <= 0)
        instance_destroy();
    exit;
}

if (InputPressedMany([INPUT_VERB.JUMP]) || (fade_out && fade_alpha >= 1))
{
    fade_out = false;
    
    if (splash_index + 1 >= array_length(splashes))
    {
        instance_create(0, 0, obj_game_intro);

        splash_index = -1;
        splash_timer.stop();
        
        fade_alpha = 1.2;
        
        exit;
    }
    
    splash_index++;
    splash_timer.active = false;
    splash_timer.start();
    
    fade_alpha = 1;
}