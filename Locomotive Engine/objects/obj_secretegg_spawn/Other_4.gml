active = (global.targetSpawn == object_index);

image_speed = real(active);
visible = active;

if (!active)
    exit;

with (obj_player.camera)
    LockSet(CAM_LOCK.OFF);

sound_instance_one_shot(sfx_secretegg_exit, x, y);
