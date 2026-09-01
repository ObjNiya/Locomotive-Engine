event_inherited();

sprite_index = choose(spr_points_1, spr_points_2, spr_points_3, spr_points_4, spr_points_5);
if (IsShowtime())
    sprite_index = choose(spr_points_1, spr_points_2, spr_points_3, spr_points_4, spr_points_5, spr_escapepoints);

image_index = M_RandomInt(image_number);

gravity = 0.5;
hspeed = M_RandomSign(10);
vspeed = random_range(-5, 0);