/**
 * Creates an instance of the given effect object.
 * @parameter {Real} x The x position to spawn the effect at.
 * @parameter {Real} y The y position to spawn the effect at.
 * @parameter {Asset.GMObject} effect_obj The effect object to create.
 * @parameter {Asset.GMSprite|Real} effect_spr (OPTIONAL) The sprite to assign to the effect being created **OR** -1 to keep the effect objects sprite. Default is -1.
 * @parameter {Asset.GMSprite|Real} palette_spr (OPTIONAL) The sprite to palette the effect with OR -1 to apply no paletting. Default is -1.
 * @parameter {Real} palette_index (OPTIONAL) The index of the palette from the palette sprite to use. Default is 0.
 * @parameter {Bool} on_gui (OPTIONAL) Whether or not to draw the effect on the GUI. Default is false.
 */
function EffectCreate(x, y, effect_obj, effect_spr = -1, palette_spr = -1, palette_index = 0, on_gui = false)
{
    with (InstanceCreate(x, y, effect_obj))
    {
        spawnedBy = other.id;
        onGui = on_gui;
        paletteSpr = palette_spr;
        paletteIndex = palette_index;
        
        if (effect_spr != -1)
        {
            sprite_index = effect_spr;
            SetLayer(sprite_index);
        }
        
        return id;
    }
}


/**
 * Creates gibs at the given position with the given sprite.
 * @parameter {Real} x The x position to spawn the gibs at.
 * @parameter {Real} y The y position to spawn the gibs at.
 * @parameter {Asset.GMSprite} sprite The sprite of the gibs being created.
 * @parameter {Real} horiz_dir In which horizontal direction the gibs should fly.
 * @parameter {Bool} animate (OPTIONAL) Whether or not the gibs should animate. Default is true.
 * @parameter {Bool} rng_frame (OPTIONAL) Whether or not the gibs starting frame should be randomized. Default is false.
 * @parameter {Asset.GMSprite|Real} palette_spr (OPTIONAL) The sprite to palette the gibs with OR -1 to apply no paletting. Default is -1.
 * @parameter {Real} palette_index (OPTIONAL) The index of the palette from the palette sprite to use. Default is 0.
 * @parameter {Bool} on_gui (OPTIONAL) Whether or not to draw the gibs on the GUI. Default is false.
 */
function GibsCreate(x, y, sprite, horiz_dir, animate = true, rng_frame = false, palette_spr = -1, palette_index = 0, on_gui = false)
{
    with (EffectCreate(x, y, obj_gibs, sprite, palette_spr, palette_index, on_gui))
    {
        hspeed = random_range(10, 18) * horiz_dir;
        
        if (horiz_dir != 0)
            image_xscale = -horiz_dir;
        
        self.animate = animate;
        rngFrame = rng_frame;
        
        event_user(0);
        
        return id;
    }
}