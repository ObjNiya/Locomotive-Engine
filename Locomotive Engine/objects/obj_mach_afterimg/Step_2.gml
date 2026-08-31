event_inherited();

if (!useAlpha || !instance_exists(spawnedBy))
{
    image_alpha = 1;
    exit;
}

var mvspd = abs(spawnedBy.x - spawnedByPrevX);
mvspd -= 4;

image_alpha = clamp(mvspd / 8, 0, 1);
spawnedByPrevX = spawnedBy.x;