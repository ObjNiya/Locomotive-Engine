with (instance_create(x, y, obj_dead_enemy_particle))
{ 
    sprite_index = other.dead_sprite;
    image_xscale = other.image_xscale;
    
    vsp = random_range(-10, -18);
    hsp = random_range(10, 18) * image_xscale;
}

repeat (3)
{
    with (instance_create(x, y, obj_slap_stars_particle))
    {
        hsp = random_range(-5, 5);
        vsp = random_range(-10, 10);
    }
}

instance_create(x, y, obj_bang_particle);