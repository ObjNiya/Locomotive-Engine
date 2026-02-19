function deactivate_game(notme)
{
    instance_deactivate_all(notme);
    
    var objects = STARTING_OBJECTS;
    
    for (var i = 0; i < STARTING_OBJECTS_COUNT; i++)
        instance_activate_object(objects[i]);
}