big = (image_xscale >= 2 && image_yscale >= 2);

if (array_length(targetTiles) >= 1 && string_lower(targetTiles[0]) == "all")
    targetTiles = layer_get_all();

array_foreach(targetTiles, function(lay, index) {
    var tilemap = layer_tilemap_get_id(lay);
    if (tilemap == -1)
        return;
    
    if (place_meeting(x, y, tilemap))
        image_alpha = 0;
});

if (!big)
    exit;

debrisAmnt = 8;
dustAmnt = 3;

image_xscale /= 2;
image_yscale /= 2;
sprite_index = bigSprite;