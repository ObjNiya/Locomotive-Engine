if (!surface_exists(gui_surface))
    gui_surface = surface_create(GAME_WIDTH, GAME_HEIGHT);

surface_set_target(gui_surface);
draw_clear_alpha(c_black, 0);