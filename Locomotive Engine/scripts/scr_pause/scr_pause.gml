/**
 * Pauses gameplay by deactivating every instance, excluding the essential ones.
 * @parameter {Bool} notme Whether or not to also disable the instance calling the function.
 * @parameter {Bool} show_menu (OPTIONAL) Whether or not to display the pause menu. If it's disabled, the player won't be able to resume the game by themselves, meaning you would need to manually call ```GameResume()``` to resume gameplay. Defaults to True.
 */
function GamePause(notme, show_menu = true)
{
    if (show_menu)
        InstanceCreate(0, 0, obj_pause_screen);
    
    instance_deactivate_all(notme);
    if (show_menu)
        instance_activate_object(obj_pause_screen);
    
    array_foreach(global.__ImportantObjs__, function(obj, index) {
        instance_activate_object(obj);
    });
    
    global.gamePaused = true;
}

/**
 * Resumes gameplay and destroys the pause screen object. (If it exists)
 */
function GameResume()
{ 
    instance_activate_all();
    InstanceDestroySafe(obj_pause_screen);
    
    global.gamePaused = false;
}

