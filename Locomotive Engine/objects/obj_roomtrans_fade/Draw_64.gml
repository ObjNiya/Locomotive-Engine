draw_set_color(image_blend);
draw_set_alpha(image_alpha);
draw_rectangle(0, 0, AlignToGuiX(fa_right), AlignToGuiY(fa_bottom), false);
draw_set_alpha(1);
draw_set_color(c_white);