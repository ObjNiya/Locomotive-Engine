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