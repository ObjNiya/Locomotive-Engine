if (!canCollide())
{
    x = 0 - sprite_width;
    y = 0 - sprite_height;
    
    image_alpha = 0.5;
    image_index = 0;
    
    return;
}

image_alpha = 1;