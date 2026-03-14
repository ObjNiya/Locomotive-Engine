active = (get_target_spawn() == object_index);

image_speed = real(active);
visible = active;

if (active)
    sound_instance_one_shot(sfx_secretegg_exit, x, y);