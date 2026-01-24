function animation_end(sprite_to_set = -1)
{
    if (round(image_index) >= image_number - 1)
    {
        if (sprite_exists(sprite_to_set))
            sprite_index = sprite_to_set;
        
        return true;
    }
    
    return false;
}