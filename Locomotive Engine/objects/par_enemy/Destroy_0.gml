with (instance_create(x, y, obj_dead_enemy))
{ 
    sprite_index = other.spr_dead;
    image_xscale = other.image_xscale;
    
    mask_index = other.mask_index;
    
    spr_palette = other.spr_palette;
    spr_palette_index = other.spr_palette_index;
    
    hsp = other.hsp;
    vsp = other.vsp;
}

repeat (3)
{
    with (instance_create(x, y, obj_slap_star_debris))
    {
        hspeed = random_range(-5, 5);
        vspeed = random_range(-10, 10);
    }
}

sound_instance_one_shot(sfx_enemy_death, x, y);

instance_create(x, y, obj_bang_particle);