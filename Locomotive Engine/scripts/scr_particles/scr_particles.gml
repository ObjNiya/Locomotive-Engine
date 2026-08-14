/**
 * This function will create the given particle object at the given position and will make the particle face the instance it was spawned by if the ```face_me``` argument is true.
 * @parameter {Real} x The x position the particle will be created at.
 * @parameter {Real} y The y position the particle will be created at.
 * @parameter {Asset.GMObject} particle_object The object index of the particle to create an instance of.
 * @parameter {Bool} face_me Whether or not the particle should face the instance that spawned it.
 */
function create_particle(x, y, particle_object, face_me = true)
{
    with (create_effect(x, y, particle_object))
    {
        if (face_me)
            image_xscale = Side(other.image_xscale, 1);
        
        return id;
    }
}

/**
 * This function will create the given particle object at the given position and will make the particle face the instance it was spawned by if the 
 * ```face_me``` argument is true ONLY when there is no other instance of that particle object in the room that has been spawned by the current instance.
 * @parameter {Real} x The x position the particle will be created at.
 * @parameter {Real} y The y position the particle will be created at.
 * @parameter {Asset.GMObject} particle_object The object index of the particle to create an instance of.
 * @parameter {Bool} face_me Whether or not the particle should face the instance that spawned it.
 */
function create_particle_repeating(x, y, particle_object, face_me = true)
{
    if (effect_repeat_check(particle_object))
        return create_particle(x, y, particle_object, face_me);
    
    return noone;
}

// TODO: Refactor