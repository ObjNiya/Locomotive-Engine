/**
 * This function will deactivate every object to suspend gameplay, but will reactivate important objects found in the ```STARTING_OBJECTS``` macro to keep the game running.
 */
function deactivate_game(notme)
{
    instance_deactivate_all(notme);
    
    var objects = STARTING_OBJECTS;
    
    for (var i = 0; i < STARTING_OBJECTS_COUNT; i++)
        instance_activate_object(objects[i]);
}