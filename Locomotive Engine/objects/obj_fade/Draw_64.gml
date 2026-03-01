draw_set_alpha(image_alpha);
draw_set_color(image_blend);
draw_rectangle(x, y, get_gui_width(), get_gui_height(), false);
draw_set_alpha(1);
draw_set_color(c_white);