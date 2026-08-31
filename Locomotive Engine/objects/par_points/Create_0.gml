eventPath = sfx_points;

value = 10;
magnetizeSpd = 5;

magnetizeTarget = noone;

DESTROY_SAVEROOM;

var tile_lay = layer_get_id("Tiles_1");
if (tile_lay == -1)
    exit;

layer = tile_lay;
depth = layer_get_depth(tile_lay);