/**
 * This function is a constructor and it will create a new Sprite that can aims to replicate the functionality of GameMakers built-in ```sprite_index``` 
 * and other associated variables inside of a struct.
 * @parameter {Asset.GMSprite} sprite_index The index of the sprite to assign to the Sprite struct.
 */
function Sprite(sprite_index) constructor
{
    self.sprite_index = -1;
    sprite_speed = 0;
    
    x = 0;
    y = 0;
    
    image_index = 0;
    image_number = 0;
    image_speed = 1;
    image_xscale = 1;
    image_yscale = 1;
    image_angle = 0;
    image_blend = c_white;
    image_alpha = 1;
    
    parent = other.id;
    
    /**
     * This function will re-assign the sprite of the Sprite struct to the given sprite index.
     * @parameter {Asset.GMSprite} sprite_index The index of the sprite to assign to the Sprite struct.
     */
    static set_sprite = function(sprite_index)
    {
        self.sprite_index = sprite_index;
        
        var new_image_number = sprite_get_number(sprite_index);
        var image_index_multiplier = max(new_image_number, image_number) / min(new_image_number, image_number);
        
        image_number = new_image_number;
        image_index *= image_index_multiplier;
        sprite_speed = sprite_get_speed(sprite_index);
        
        if (sprite_get_speed_type(sprite_index) == spritespeed_framespersecond)
            sprite_speed /= game_get_speed(gamespeed_fps);
    }
    
    /// @ignore
    static step = function()
    {
        if (round(image_index) >= image_number)
            image_index = 0;
        
        image_index += sprite_speed * image_speed;
    }
    
    /**
     * This function will draw the sprite assigned to the Sprite struct and will apply the Sprite structs various image modifiers.
     */
    static draw = function()
    {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
    
    set_sprite(sprite_index);
    
    if (!instance_exists(obj_sprite_manager))
        instance_create_depth(0, 0, 999, obj_sprite_manager);
    
    array_push(obj_sprite_manager.sprites, self);
}