collider = new Collider(true);
collider.set_slope(is_slope, sign(image_xscale) == -1, sign(image_yscale) == -1);
collider.set_platform(is_platform, platform_direction);
collider.set_conveyor_speed(left_side_conveyor_speed, right_side_conveyor_speed, top_side_conveyor_speed, bottom_side_conveyor_speed);
collider.set_breakable(breakable, breakable_toughness);

if is_slope
	collider.add_tag("slope")
