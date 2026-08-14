repeat (debris_amount)
{
    var debris_offset = effects_get_offset();
    
    with (InstanceCreate(x + debris_offset[0], y + debris_offset[1], obj_block_debris))
    {
        sprite_index = other.debris_sprite;
        image_speed = 0;
        image_index = irandom(image_number);
    }
}

Sleep(5);
InstanceCreate(x + 32, y + 32, obj_bang_particle);
sound_instance_one_shot(destroy_sound, x, y);
add_saveroom();

with (obj_player)
    camera.shake_set(20, 0.666);