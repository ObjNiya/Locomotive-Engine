depth = -500
tiles = array_create(3, [])
tilemap_sprite = array_create(3, -4)
hasLayer = false;
alpha = 1;
tile_surface = surface_create(sprite_width, sprite_height);
circle_radius = 0;

for (var i = 0; i < 3; i++)
{
    var lay_id = layer_get_id(concat("Tiles_Secret", (i + 1)))
	trace(concat("Tiles_Secret", (i + 1)))
    if (lay_id != -1)
    {
		hasLayer = true;
        var map_id = layer_tilemap_get_id(lay_id)
        tilemap_sprite[i] = tilemap_get_tileset(map_id)
		trace(tileset_get_name(tilemap_sprite[i]))
        for (var yy = 0; yy < image_yscale; yy++)
        {
            for (var xx = 0; xx < image_xscale; xx++)
            {
                var _x = (x + (xx * 32))
                var _y = (y + (yy * 32))
                var data = tilemap_get_at_pixel(map_id, _x, _y)
                array_push(tiles[i], {
					x : _x,
					y : _y,
					data : tile_get_index(tile_get_index(data)),
				});
                tilemap_set_at_pixel(map_id, tile_set_empty(data), _x, _y)
            }
        }
    }
}
if !hasLayer
	exit;
var surf = surface_create(sprite_width, sprite_height)
surface_set_target(surf)
for (var k = 0; k < array_length(tilemap_sprite); k++)
{
	if (tilemap_sprite[k] != -4)
	{
		for (var i = 0; i < array_length(tiles[k]); i++)
		{
			var b = tiles[k][i]
			draw_tile(tilemap_sprite[k], b.data, 0, b.x - x, b.y - y) 
		}
	}
}
surface_reset_target()
sprite = sprite_create_from_surface(surf, 0, 0, sprite_width, sprite_height, false, false, 0, 0)