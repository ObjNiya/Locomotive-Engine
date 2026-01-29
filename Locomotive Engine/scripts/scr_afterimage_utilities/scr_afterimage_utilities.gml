function create_afterimage(x, y, afterimage_object)
{
    var afterimage_id = create_particle(x, y, afterimage_object);
    
    with (afterimage_id)
    {
        sprite_index = other.sprite_index;
        image_index = other.image_index - 1;
        
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
        
        image_angle = other.image_angle;
        image_blend = other.image_blend;
        image_alpha = other.image_alpha * real(other.visible);
    }
}

function create_afterimage_repeating(x, y, afterimage_object)
{
    var spawn_afterimage = (!instance_exists(afterimage_object) || (instance_exists(afterimage_object) && afterimage_object.spawner_id != id))
    return (spawn_afterimage) ? create_afterimage(x, y, afterimage_object) : noone;    
}