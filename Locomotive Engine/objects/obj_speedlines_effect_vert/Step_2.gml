event_inherited();

if (!instance_exists(spawnedBy))
    exit;

image_xscale = 1;
image_yscale = -Side(spawnedBy.vsp, image_yscale);