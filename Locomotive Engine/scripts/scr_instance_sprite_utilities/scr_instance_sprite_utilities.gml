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

function animation_end_ext(condition, sprite_to_set)
{
    var sprite_to_give = (condition) ? sprite_to_set : -1;
    
    return animation_end(sprite_to_give);
}

function sprite_index_set(sprite, subimage)
{
    sprite_index = sprite;
    image_index = subimage;
}