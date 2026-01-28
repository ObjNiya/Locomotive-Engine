/**
 * This function will initialize various variables to help with implementing movement.
 * ```movespeed``` can be used to dictate the maximum movement speed or to use as an absolute movement speed value to be set to your objects
 * actual horizontal speed value multiplied by the movement direction.
 * ```vertical_movespeed``` can be used in identically to ```movespeed```, just for the Y axis.
 * ```dir``` can be used in combination with movespeed to dictate which direction your object will move in.
 * ```vertical_dir```, just like with ```vertical_movespeed``` and ```movespeed```, is a vertical variant of ```dir``` for the Y axis.
*/
function initialize_movement_helpers()
{
    movespeed = 0;
    vertical_movespeed = 0;
    
    dir = 0;
    vertical_dir = 0;
}