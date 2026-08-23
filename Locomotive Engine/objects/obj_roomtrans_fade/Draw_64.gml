draw_set_color(image_blend);

if faceTransition
{
	var _player_pos_x = playerId.x - camera_get_view_x(view_camera[playerId.camera.id]); // Get the player position relative to the screen
	var _player_pos_y = playerId.y - camera_get_view_y(view_camera[playerId.camera.id]);
	var _x = map(image_alpha, 0, 0.9, GuiCalcX(fa_center), GuiCalcPos(_player_pos_x));
	var _y = map(image_alpha, 0, 0.9, GuiCalcY(fa_middle), GuiCalcPos(_player_pos_y));
	var _size = max(map(image_alpha, 0, 1, 18, -1), 0) * GuiGetScale();
	
	draw_set_mask_ext(spr_facehole_damian, 0, _x, _y, _size, _size, 0, image_blend, 1, true);
	draw_rectangle(0, 0, GuiCalcX(fa_right), GuiCalcY(fa_bottom), false);
	draw_reset_mask();
}
else
{
	draw_set_alpha(image_alpha);
	draw_rectangle(0, 0, GuiCalcX(fa_right), GuiCalcY(fa_bottom), false);
}

draw_set_color(c_white);
draw_set_alpha(1);