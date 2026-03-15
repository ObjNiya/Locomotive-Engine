#macro IMPORTANT_OBJS [obj_fmod_studio, obj_screen, obj_room_goto, obj_layer_manager, __InputUpdateController]

global.deactive_ins = [];

/**
 * This function will deactivate every object to suspend gameplay, but will reactivate important objects found in the ```STARTING_OBJECTS``` macro to keep the game running.
 * @parameter {Boolean} notme Whether to keep the calling instance activated (true) or not (false).
 */
function deactivate_game(notme)
{
    with (all)
    {
        if ((id != other.id || !notme) && array_get_index(IMPORTANT_OBJS, object_index) == -1)
        {
            array_push(global.deactive_ins, id);
            instance_deactivate_object(id);
        }
    }
}

/**
 * With this function you can activate all instances previously deactivated by ```deactivate_game()```. Note that if you have deactivated an instance or object that has been flagged as Persistent, then you will need to reactivate it again with this function before changing room, otherwise it will not be carried over and will be discarded instead. Note too that activation is not instantaneous, and an instance that has been activated in this way will not be considered to be active until the end of the event in which the function was called.
 */
function reactivate_game()
{
    while (array_length(global.deactive_ins) > 0)
        instance_activate_object(array_pop(global.deactive_ins));
}