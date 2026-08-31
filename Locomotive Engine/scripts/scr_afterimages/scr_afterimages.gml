/**
 * Creates an afterimage of the current instance and returns its ID.
 * @parameter {Asset.GMObject} afterimg_obj Which afterimage object to create.
 * @parameter {Asset.GMSprite|Real} palette_spr (OPTIONAL) The sprite to palette the afterimage with **OR** -1 to apply no paletting. Default is -1.
 * @parameter {Real} palette_index (OPTIONAL) The index of the palette from the palette sprite to use. Default is 0.
 * @parameter {Bool} on_gui (OPTIONAL) Whether or not to draw the afterimage on the GUI.
 * @returns {Id.Instance}
 */
function AfterimgCreate(afterimg_obj, palette_spr = -1, palette_index = 0, on_gui = false)
{
    var vh = variable_instance_exists(id, "visualX");
    
    with (EffectCreate(x, y, afterimg_obj, sprite_index, palette_spr, palette_index, on_gui))
    {
        image_index = max(other.image_index - 1, 0);
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
        image_angle = other.image_angle;
        image_blend = other.image_blend;
        image_alpha = other.image_alpha * real(other.visible);
        
        if (vh)
        {
            x += other.visualX;
            y += other.visualY;
            
            image_xscale *= other.visualXScale;
            image_yscale *= other.visualYScale;
            image_angle += other.visualAngle;
        }
        
        return id;
    }
}


/**
 * Creates a fading afterimage of the current instance and returns its ID.
 * @parameter {Real} fade (OPTIONAL) The starting alpha of the fading afterimage. Default is 0.8.
 * @parameter {Real} fade_spd (OPTIONAL) By how much the fading afterimage fades away each frame. Default is 0.15.
 * @parameter {Asset.GMSprite|Real} palette_spr (OPTIONAL) The sprite to palette the fading afterimage with **OR** -1 to apply no paletting. Default is -1.
 * @parameter {Real} palette_index (OPTIONAL) The index of the palette from the palette sprite to use. Default is 0.
 * @parameter {Bool} on_gui (OPTIONAL) Whether or not to draw the fading afterimage on the GUI.
 * @returns {Id.Instance<obj_fade_afterimg>}
 */
function FadeAfterimgCreate(fade = 0.8, fade_spd = 0.15, palette_spr = -1, palette_index = 0, on_gui = false)
{
    with (AfterimgCreate(obj_fade_afterimg, palette_spr, palette_index, on_gui))
    {
        self.fade = fade;
        fadeSpd = fade_spd;
        image_alpha = fade;
        
        return id;
    }
}


/**
 * Creates a mach afterimage of the current instance and returns its ID.
 * @parameter {Bool} use_alpha (OPTIONAL) Whether or not the mach afterimage should have translucency based on the spawners speed. Default is true.
 * @parameter {Real} lifespan (OPTIONAL) How many frames the mach afterimage should last. Default is 15.
 * @parameter {Constant.Color} color_a (OPTIONAL) The primary color of the mach afterimage. Default is purple.
 * @parameter {Constant.Color} color_b (OPTIONAL) The secondary color of the mach afterimage that the primary one is mixed with by a random amount. Default is yellow.
 * @parameter {Bool} on_gui (OPTIONAL) Whether or not to draw the mach afterimage on the GUI.
 * @returns {Id.Instance<obj_mach_afterimg>}
 */
function MachAfterimgCreate(use_alpha = true, lifespan = 15, color_a = c_purple, color_b = c_yellow, on_gui = false)
{
    with (AfterimgCreate(obj_mach_afterimg, -1, 0, on_gui))
    {
        useAlpha = use_alpha;
        self.lifespan = lifespan;
        colorA = color_a;
        colorB = color_b;
  
        alarm[2] = real(lifespan);
        return id;
    }
}