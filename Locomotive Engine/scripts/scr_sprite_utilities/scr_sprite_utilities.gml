/**
 * Sets the current instances' sprite and image index according to the given arguments.
 * @parameter {Asset.GMSprite} sprite The sprite to set.
 * @parameter {Real} subimage The image index to set.
 */
function SpriteSet(sprite, subimage)
{
    sprite_index = sprite;
    image_index = subimage;
}

/**
 * Returns if the animation on the current instance has finished. If true and a sprite was given, it will set the current instances' sprite to the given one.
 * @parameter {Asset.GMSprite|Real} sprite_to_set (OPTIONAL) The sprite to set once the animation has finished.
 */
function AnimationEnd(sprite_to_set = -1)
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
 * Acts the same as ```AnimationEnd()```, except that it runs an extra condition before setting the current instances' sprite to the given one.
 * @parameter {Bool} condition The condition to check before applying the given sprite to the current instance.
 * @parameter {Asset.GMSprite|Real} sprite_to_set The sprite to set once the animation has finished and the condition is True.
 */
function AnimationEndExt(condition, sprite_to_set)
{
    var sprite_to_give = (condition) ? sprite_to_set : -1;
    
    return AnimationEnd(sprite_to_give);
}