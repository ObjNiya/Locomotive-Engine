function hud_pointsbook_add_collect_effect(value)
{
    var collect_effect = new Sprite(sprite_index);
        
    with (collect_effect)
    {
        x = other.x - camera_get_view_x(view_camera[0]);
        y = other.y - camera_get_view_y(view_camera[0]);
        
        image_index = other.image_index;
        image_speed = other.image_speed;
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
        image_angle = other.image_angle;
        image_blend = other.image_blend;
        image_alpha = other.image_alpha;
        
        self.value = value;
    }
    
    with (obj_hud_pointsbook)
        array_push(collectable_effect_array, collect_effect);       
        
    return collect_effect;
}