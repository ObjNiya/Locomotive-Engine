/**
 * This function will create the given particle object at the given position and will make the particle face the instance it was spawned by if the ```face_me``` argument is true.
 * @parameter {Real} x The x position the particle will be created at.
 * @parameter {Real} y The y position the particle will be created at.
 * @parameter {Asset.GMObject} afterimage_object The object index of the particle to create an instance of.
 */
function create_particle(x, y, particle_object, face_me = true)
{
    var particle_id = instance_create(x, y, particle_object);

    particle_id.spawner_id = id;
    
    if (face_me) // This is something you'd want with every particle in Pizza Tower
        particle_id.image_xscale = sign(image_xscale);
    
    return particle_id;
}

/**
 * This function will create the given particle object at the given position and will make the particle face the instance it was spawned by if the 
 * ```face_me``` argument is true ONLY when there is no other instance of that particle object in the room that has been spawned by the current instance.
 * @parameter {Real} x The x position the particle will be created at.
 * @parameter {Real} y The y position the particle will be created at.
 * @parameter {Asset.GMObject} afterimage_object The object index of the particle to create an instance of.
 */
function create_particle_repeating(x, y, particle_object)
{
    var spawn_particle = (!instance_exists(particle_object) || (instance_exists(particle_object) && particle_object.spawner_id != id))
    return (spawn_particle) ? create_particle(x, y, particle_object) : noone;
}