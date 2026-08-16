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

SaveroomAdd();
sound_instance_one_shot(sfx_enemy_death, x, y);
InstanceCreate(x, y, obj_bang_particle);

array_foreach(global.cameras, function(camera, index) {
    camera.shake_set(3, 0.05);
})