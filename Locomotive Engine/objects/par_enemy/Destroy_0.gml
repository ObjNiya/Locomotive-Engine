with (InstanceCreate(x, y, obj_dead_enemy))
{ 
    sprite_index = other.deadSpr;
    image_xscale = other.image_xscale;
    
    mask_index = other.mask_index;
    
    paletteSpr = other.paletteSpr;
    paletteIndex = other.paletteIndex;
    
    var killer_x = -1;
    
    if (instance_exists(other.my_killer))
        killer_x = other.my_killer.x;
    
    hsp = sign(x - killer_x) * random_range(10, 18);
    vsp = random_range(-10, -18);
    
    if (x != killer_x)
        image_xscale = -sign(x - killer_x);
}

sound_instance_one_shot(sfx_enemydeath, x, y);
repeat (3)
{
    with (InstanceCreate(x, y, obj_slap_star_debris))
    {
        hspeed = M_RandomSign(5);
        vspeed = M_RandomSign(10);
    }
}
InstanceCreate(x, y, obj_bang_particle);
SaveroomAdd();