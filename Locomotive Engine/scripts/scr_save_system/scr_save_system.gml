#macro MAX_SAVE_SIZE 3000 // The maximum save file size in bytes

#macro GLOBAL_SAVE_PATH working_directory + "global_save.sav"

global.save = buffer_create(MAX_SAVE_SIZE, buffer_grow, 1);

function save_initialize()
{
    buffer_write(global.save, buffer_string, "Hello");
    buffer_write(global.save, buffer_u64, 64);
    
    buffer_save(global.save, working_directory + "save.sav")
}