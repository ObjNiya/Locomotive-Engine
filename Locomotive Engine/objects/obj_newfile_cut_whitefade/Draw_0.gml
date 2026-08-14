image_alpha = Approach(image_alpha, 1, 0.1);

draw_set_alpha(image_alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);