/**
 * This function will initialize various variables to help with implementing movement.
 * ```movespeed``` can be used to dictate the maximum movement speed or to use as an absolute movement speed value to be set to your objects
 * actual horizontal speed value multiplied by the movement direction.
 * ```vert_movespeed``` can be used in identically to ```movespeed```, just for the Y axis.
 * ```accel``` can be used to determine by how many pixels your object will reach it's maximum speed.
 * ```vert_accel``` just like ```accel```, but reserved for the Y axis.
 * ```dir``` can be used in combination with movespeed to dictate which direction your object will move in.
 * ```vert_dir```, just like with ```vert_movespeed``` and ```movespeed```, is a vertical variant of ```dir``` for the Y axis.
 * ```momentum``` could be used to determine if your object should keep it's speed even if the player is pressing no direction.
 * ```vert_momentum``` can be used just like ```momentum```, except for the Y axis.
*/
function movement_helpers_initialize()
{
    movespeed = 0;
    vert_movespeed = 0;
    
    accel = 0;
    vert_accel = 0;
    
    dir = 0;
    vert_dir = 0;
    
    momentum = false;
    vert_momentum = false;
}