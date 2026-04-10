active = (get_target_spawn() == object_index);

image_speed = real(active);
visible = active;

if (!active)
    exit;

with (obj_player)
    camera.properties_set_locked(false, false, false);

sound_instance_one_shot(sfx_secretegg_exit, x, y);
