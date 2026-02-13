/**
 * This function will set the current instances' sprite- and image index according to the given arguments.
 * @parameter {Asset.GMSprite} sprite The sprite to set.
 * @parameter {Real} subimage The image index to set.
 */
function sprite_set(sprite, subimage)
{
    sprite_index = sprite;
    image_index = subimage;
}

/**
 * This function will check if the animation on the current instance has finished, and will set the instances' sprite to the given one if applicable.
 * @parameter {Asset.GMSprite|Real} sprite_to_set (OPTIONAL) The sprite to set once the animation has finished.
 */
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

/**
 * This function will behave the same as ```animation_end```, except that it checks for a user-defined condition whether or not it can set the sprite.
 * @parameter {Bool} condition Whether or not sprite to set will be assigned when the animation is finished.
 * @parameter {Asset.GMSprite|Real} sprite_to_set The sprite to set once the animation has finished.
 */
function animation_end_ext(condition, sprite_to_set)
{
    var sprite_to_give = (condition) ? sprite_to_set : -1;
    
    return animation_end(sprite_to_give);
}