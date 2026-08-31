if (!instance_exists(spawnedBy))
{
    instance_destroy();
    exit;
}

x = spawnedBy.x + followXOffset;
y = spawnedBy.y + followYOffset;
image_xscale = spawnedBy.image_xscale;
image_yscale = spawnedBy.image_yscale;
image_angle = spawnedBy.image_angle;