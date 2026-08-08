repeat (debris_amount)
{
    var debris_offset = effects_get_offset();
    
    with (InstanceCreate(x + debris_offset[0], y + debris_offset[1], obj_block_debris))
        sprite_index = other.debris_sprite;
}

repeat (dust_amount)
{
    var dust_offset = effects_get_offset();
    
    with (create_particle(x + dust_offset[0], y + dust_offset[1], obj_block_dust_particle, false))
        sprite_index = other.dust_sprite;
}

sleep(5);
sound_instance_one_shot(destroy_sound, x, y);
add_saveroom();