if (array_length(targetTiles) >= 1)
    TilesDestroyArea(targetTiles, bbox_left, bbox_top, bbox_right, bbox_bottom);

var mid_x = x + (sprite_width / 2);
mid_x -= sprite_xoffset;

var mid_y = y + (sprite_height / 2);
mid_y -= sprite_yoffset;

PartSpawn(mid_x, mid_y, debrisPart, sprite_width / 2, sprite_height / 2, ps_shape_rectangle, ps_distr_gaussian, false, debrisAmnt);

with (instance_place(x, y, [par_points, obj_secretegg]))
    visible = true;

SaveroomAdd();
Sleep(5);
PartSpawn(x + 32, y + 32, PART_TYPES.BANG);
sound_instance_one_shot(destroySnd, x, y);
obj_player.camera.ShakeSet(20, 0.666, 0);