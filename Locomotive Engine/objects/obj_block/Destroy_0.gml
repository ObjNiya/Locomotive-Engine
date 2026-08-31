var mid_x = x + (sprite_width / 2);
mid_x -= sprite_xoffset;

var mid_y = y + (sprite_height / 2);
mid_y -= sprite_yoffset;

PartSpawn(mid_x, mid_y, debrisPart, sprite_width / 2, sprite_height / 2, ps_shape_rectangle, ps_distr_gaussian, false, debrisAmnt);
PartSpawn(mid_x, mid_y, dustPart, sprite_width / 2, sprite_height / 2, ps_shape_rectangle, ps_distr_gaussian, false, dustAmnt);

with (instance_place(x, y, [par_points, obj_secretegg]))
    visible = true;

SaveroomAdd();
Sleep(5);
sound_instance_one_shot(destroySnd, x, y);