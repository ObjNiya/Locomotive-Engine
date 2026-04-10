with (spawner_id)
    other.visible = visible;
image_alpha -= fade_speed;

if (image_alpha <= 0)
    instance_destroy();