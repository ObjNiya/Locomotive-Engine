global.__ImportantObjs__ = [obj_fmod_studio, obj_screensizer, obj_room_goto, obj_layer_manager, obj_room_events, __InputUpdateController];

function PauseGame(notme, show_menu)
{
    instance_deactivate_all(notme);
    
    array_foreach(global.__ImportantObjs__, function(obj, index) {
        instance_activate_object(obj);
    });
    
    if (show_menu)
        InstanceCreate(0, 0, obj_pause_screen);
}

function ResumeGame()
{ 
    instance_activate_all();
    InstanceDestroySafe(obj_pause_screen);
}

