big = (image_xscale >= 2 && image_yscale >= 2);

if ((is_array(targetTiles) && !ArrayIsEmpty(targetTiles)) || targetTiles != -1)
    image_alpha = 0;

if (!big)
    exit;

debrisAmnt = 8;
dustAmnt = 3;

image_xscale /= 2;
image_yscale /= 2;
sprite_index = bigSprite;