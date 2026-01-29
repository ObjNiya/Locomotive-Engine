function create_particle(x, y, particle_object, face_me = true)
{
    var particle_id = instance_create(x, y, particle_object);

    particle_id.spawner_id = id;
    
    if (face_me) // This is something you'd want with every particle in Pizza Tower
        particle_id.image_xscale = sign(image_xscale);
    
    return particle_id;
}

function create_particle_repeating(x, y, particle_object)
{
    var spawn_particle = (!instance_exists(particle_object) || (instance_exists(particle_object) && particle_object.spawner_id != id))
    return (spawn_particle) ? create_particle(x, y, particle_object) : noone;
}