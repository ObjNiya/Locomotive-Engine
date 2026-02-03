function deactivate_game(notme)
{
    instance_deactivate_all(notme);
    
    for (var i = 0; i < array_length(global.essential_objects); i++)
        instance_activate_object(global.essential_objects[i]);
}