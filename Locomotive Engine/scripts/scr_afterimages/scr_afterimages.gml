/**
 * This function will create the given afterimage object at the given position and will set all of the afterimage sprite drawing variables to the values from the instance who spawned it.
 * @parameter {Real} x The x position the afterimage will be created at.
 * @parameter {Real} y The y position the afterimage will be created at.
 * @parameter {Asset.GMObject} afterimage_object The object index of the afterimage to create an instance of.
 * @returns {Id.Instance}
 */
function create_afterimage(x, y, afterimage_object)
{
    with (create_effect(x, y, afterimage_object))
    {
        sprite_index = other.sprite_index;
        image_index = other.image_index - 1;
        
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
        
        image_angle = other.image_angle;
        image_blend = other.image_blend;
        image_alpha = other.image_alpha * real(other.visible);
        
        return id;
    }
}

function create_afterimage_vh(x, y, afterimage_object)
{
    with (create_effect(x + visual_x, y + visual_y, afterimage_object))
    {
        sprite_index = other.sprite_index;
        image_index = other.image_index - 1;
        
        image_xscale = other.visual_xscale;
        image_yscale = other.visual_yscale;
        
        image_angle = other.visual_angle;
        image_blend = other.image_blend;
        image_alpha = other.image_alpha * real(other.visible);
        
        return id;
    }
}

/**
 * This function will create the given afterimage object at the given position and will set all of the afterimage sprite drawing variables to the values 
 * from the instance who spawned it ONLY when there is no other instance of that afterimage object in the room that has been spawned by the current instance.
 * @parameter {Real} x The x position the afterimage will be created at.
 * @parameter {Real} y The y position the afterimage will be created at.
 * @parameter {Asset.GMObject} afterimage_object The object index of the afterimage to create an instance of.
 */
function create_afterimage_repeating(x, y, afterimage_object)
{
    if (effect_repeat_check(afterimage_object))
        return create_afterimage(x, y, afterimage_object);
    
    return noone;
}

function create_afterimage_repeating_vh(x, y, afterimage_object)
{
    if (effect_repeat_check(afterimage_object))
        return create_afterimage_vh(x, y, afterimage_object);
    
    return noone;
}