gpu_set_blendenable(false);
draw_surface_ext(application_surface, x, y, actual_xscale, actual_yscale, 0, c_white, 1);
gpu_set_blendenable(true);

draw_rectangle(x, y, x + width + 1, y + height + 1, true);