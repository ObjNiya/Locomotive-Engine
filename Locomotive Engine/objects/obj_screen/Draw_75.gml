surface_reset_target();

gui_draw_prefix();
draw_surface_ext(gui_surface, app_x, app_y, 1, 1, 0, gui_blend, gui_alpha);
gui_draw_postfix();