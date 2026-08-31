if (sprite_index == spr_spring_activate)
    exit;

SpriteSet(spr_spring_activate, 0);
sound_instance_one_shot(sfx_spring, x, y);

with (other)
{
    var spring_dir = sign(other.image_yscale);
    
    x = other.x;
    
    if (spring_dir == -1)
    {
        SmcSetState("Groundpound");
        
        vsp = 10;
        sprite_index = spr_bananaslip_bump;
    }
    else if (spring_dir == 1)
    {
        SmcSetState("Sjump");
        vsp = -10;
        
        sprite_index = spr_springlaunch;
    }
    
    EffectCreate(x, y, obj_speedlines_effect_vert);
}