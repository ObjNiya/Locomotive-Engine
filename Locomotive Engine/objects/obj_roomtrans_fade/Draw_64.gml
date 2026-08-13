draw_set_color(image_blend);
draw_set_alpha(image_alpha);
draw_rectangle(0, 0, GuiCalcX(fa_right, 0), GuiCalcY(fa_bottom, 0), false);
draw_set_alpha(1);
draw_set_color(c_white);