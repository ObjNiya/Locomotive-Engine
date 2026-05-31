with (hurtbox)
    instance_destroy();

with (instance_create(x, y, obj_dead_enemy))
{ 
    sprite_index = other.spr_dead;
    image_xscale = other.image_xscale;
    
    mask_index = other.mask_index;
    
    paletteSpr = other.spr_palette;
    paletteIndex = other.spr_palette_index;
    
    var killer_x = -1;
    
    if (instance_exists(other.my_killer))
        killer_x = other.my_killer.x;
    
    hsp = sign(x - killer_x) * random_range(10, 18);
    vsp = random_range(-10, -18);
    
    if (x != killer_x)
        image_xscale = -sign(x - killer_x);
}

sound_instance_one_shot(sfx_enemy_death, x, y);
instance_create(x, y, obj_bang_particle);

array_foreach(global.cameras, function(camera, index) {
    camera.shake_set(3, 0.05);
})