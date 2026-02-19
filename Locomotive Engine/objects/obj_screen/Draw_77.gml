app_draw_prefix();
draw_surface_ext(application_surface, app_x, app_y, 1, 1, 0, app_blend, app_alpha);
app_draw_postfix();

draw_rectangle(app_x, app_y, app_x + app_width + 1, app_y + app_height + 1, true);