/**
 * Creates a virtual sprite to be drawn that automatically animates.
 * @parameter {Asset.GMSprite} sprite_index The sprite to animate and draw.
 */
function Animator(sprite_index) constructor
{
    spriteIndex = -1;
    spriteSpeed = 0;
    
    imageIndex = 0;
    imageNumber = 0;
    imageSpeed = 1;
    imageXScale = 1;
    imageYScale = 1;
    imageAngle = 0;
    imageBlend = c_white;
    imageAlpha = 1;
    
    timescale = 1;
    
    
    /**
     * Sets the Animators sprite and associated variables.
     * @parameter {Asset.GMSprite} sprite_index The sprite to set.
     */
    static SetSprite = function(sprite_index)
    {
        spriteIndex = sprite_index;
        if (!sprite_exists(spriteIndex))
            return;
        
        var new_image_num = sprite_get_number(spriteIndex);
        var image_index_mult = min(new_image_num, imageNumber) / max(new_image_num, imageNumber);
        
        imageNumber = new_image_num;
        imageIndex *= image_index_mult;
        spriteSpeed = sprite_get_speed(spriteIndex);
        
        if (sprite_get_speed_type(spriteIndex) == spritespeed_framespersecond)
            spriteSpeed /= game_get_speed(gamespeed_fps);
    }
    
    
    /// @ignore
    static Step = function()
    {
        if (imageIndex > imageNumber)
            imageIndex = 0;
        
        imageIndex += spriteSpeed * imageSpeed;
    }
    
    
    /**
     * Destroys the Animators Time Source that it used to automatically animate to prevent memory leaking.
     */
    static CleanUp = function()
    {
        time_source_stop(stepTimeSource);
        time_source_destroy(stepTimeSource);
    }
    
    
    /**
     * Draws the Animators sprite with its transformations at the given position.
     * @parameter {Real} x The x position to draw the sprite at.
     * @parameter {Real} y The y position to draw the sprite at.
     */
    static Draw = function(x, y)
    {
        draw_sprite_ext(spriteIndex, imageIndex, x, y, imageXScale, imageYScale, imageAngle, imageBlend, imageAlpha);
    }
    
    stepTimeSource = time_source_create(time_source_game, 1, time_source_units_frames, Step, [], -1);
    SetSprite(sprite_index);
}


/**
 * DEPRECATED This function is a constructor and it will create a new Sprite that can aims to replicate the functionality of GameMakers built-in ```sprite_index``` 
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
    
    if (variable_instance_exists(other, "id"))
        parent = other.id;
    else
        parent = -1;
    
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
}