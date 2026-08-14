/// @ignore
function create_effect(x, y, effect_object)
{
    with (InstanceCreate(x, y, effect_object))
    {
        spawner_id = other.id;
        
        return id;
    }
}

/// @ignore
function effect_repeat_check(effect_object)
{
    return !(instance_exists(effect_object) && effect_object.spawner_id == id);
}

// TODO: Refactor