/**
 * Initializes variables on the current instance to assist in creating movement, creating the following: 
 * ```movespeed```, ```vertMovespeed```, ```accel```, ```vertAccel```, ```deccel```, ```vertDeccel```, ```dir```, ```vertDir```, ```momentum``` and ```vertMomentum```.
 * All of these variables except ```momentum``` and ```vertMomentum``` are Real numbers, ```momentum``` and ```vertMomentum``` are Booleans instead.
*/
function MovementHelpersInit()
{
    movespeed = 0;
    vertMovespeed = 0;
    
    accel = 0;
    vertAccel = 0;
    
    deccel = 0;
    vertDeccel = 0;
    
    dir = 0;
    vertDir = 0;
    
    momentum = false;
    vertMomentum = false;
}