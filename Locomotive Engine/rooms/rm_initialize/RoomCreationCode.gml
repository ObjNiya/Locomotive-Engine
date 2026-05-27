initialize_game();
save_initialize();
instance_create(0, 0, obj_player);
queue_room(rm_file_select, obj_spawn_a);
goto_room();