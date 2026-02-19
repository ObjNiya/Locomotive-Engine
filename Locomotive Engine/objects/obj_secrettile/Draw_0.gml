if !bbox_in_camera(view_camera[0], 32)
    exit;
if (!hasLayer)
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, alpha)
if (hasLayer && array_length(tiles) > 0)
{
	if !surface_exists(tile_surface)
		tile_surface = surface_create(sprite_width, sprite_height);
	else
	{
		surface_set_target(tile_surface)
		draw_sprite(sprite, 0, 0, 0)
		gpu_set_blendmode(bm_subtract)
		draw_circle_color(obj_player.x - x, obj_player.y - y, circle_radius, c_black, c_black, false)
		gpu_set_blendmode(bm_normal)	
		surface_reset_target()
		draw_surface(tile_surface, x, y);
	}
}