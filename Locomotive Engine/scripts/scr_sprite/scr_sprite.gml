/**
 * Creates a virtual sprite to be drawn that automatically animates.
 * @parameter {Asset.GMSprite} sprite_index The sprite to animate and draw.
 */
function Animator(sprite_index) constructor
{
    spriteIndex = -1;
    spriteSpeed = 0;
    
    x = 0;
    y = 0;
    
    imageIndex = 0;
    imageNumber = 0;
    imageSpeed = 1;
    imageXScale = 1;
    imageYScale = 1;
    imageAngle = 0;
    imageBlend = c_white;
    imageAlpha = 1;
    
    visible = true;
    
    
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
        
        return self;
    }
    
    
    /**
     * Sets the Animators x and y coordinate to the given position.
     * @parameter {Real} x The x position to set.
     * @parameter {Real} y The y position to set.
     */
    static SetPosition = function(x, y)
    {
        self.x = x;
        self.y = y;
        
        return self;
    }
    
    
    /**
     * Sets the Animators scale and angle to the given values.
     * @parameter {Real} image_xscale The x scale to set. (As a scalar)
     * @parameter {Real} image_yscale The y scale to set. (As a scalar)
     * @parameter {Real} image_angle The angle to set.
     */
    static SetTransform = function(image_xscale, image_yscale, image_angle)
    {
        imageXScale = image_xscale;
        imageYScale = image_yscale;
        imageAngle = image_angle;
        
        return self;
    }
	
    
    /**
     * Sets the Animators blending color and alpha to the given values.
     * @parameter {Constant.Color} image_blend The blending color to set.
     * @parameter {Real} image_alpha The alpha to set. (As a scalar).
     */
    static SetBlend = function(image_blend, image_alpha)
    {
        imageBlend = image_blend;
        imageAlpha = image_alpha;
    }
    
    /**
     * Returns whether or not the Animator has finished its animation.
     * @parameter {Asset.GMSprite|Real} sprite_to_set (OPTIONAL) What sprite to change to when the Animators animation has finished, or -1 if the sprite shouldn't change. Default is -1.
     */
	static AnimationEnded = function(sprite_to_set = -1)
	{
	    if (imageIndex >= imageNumber)
	    {
	        if (sprite_to_set != -1)
	            SetSprite(sprite_to_set);
        
	        return true;
	    }
    
	    return false;
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
    static Draw = function(x = self.x, y = self.y)
    { 
        draw_sprite_ext(spriteIndex, imageIndex, x, y, imageXScale, imageYScale, imageAngle, imageBlend, imageAlpha * real(visible));
    }
    
    stepTimeSource = time_source_create(time_source_global, 1, time_source_units_frames, function() { method_call(Step) }, [], -1);
    time_source_start(stepTimeSource);
    SetSprite(sprite_index);
}