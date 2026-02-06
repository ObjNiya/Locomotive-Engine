// GMEXT-FMOD doesn't have JSDoc so I don't need to JSDoc my own functions either.

function fmod_studio_event_instance_move(event_instance_ref, x, y)
{
    var fmod_3d_attributes = new Fmod3DAttributes();
    
    with (fmod_3d_attributes.position)
    {
        self.x = x;
        self.y = y;
    }
    
    with (fmod_3d_attributes.forward)
        z = 1;
    
    with (fmod_3d_attributes.up)
        self.y = 1;
    
    fmod_studio_event_instance_set_3d_attributes(event_instance_ref, fmod_3d_attributes);
}

function fmod_studio_event_instance_create(event_description_ref, x = 0, y = 0)
{
    var fmod_studio_event_instance = fmod_studio_event_description_create_instance(fmod_studio_system_get_event(event_description_ref));
    fmod_studio_event_instance_move(fmod_studio_event_instance, x, y);
    
    with (obj_fmod_studio_manager)
        array_push(sound_instances, fmod_studio_event_instance);
    
    return fmod_studio_event_instance;
}

function fmod_studio_event_instance_one_shot(event_description_ref, x = 0, y = 0)
{
    var fmod_studio_event_instance = fmod_studio_event_instance_create(event_description_ref, x, y);
    
    fmod_studio_event_instance_start(fmod_studio_event_instance);
    fmod_studio_event_instance_release(fmod_studio_event_instance);
    
    return fmod_studio_event_instance;
}

/// @ignore
function __fmod_studio_event_instance_all__(func, parameters = -1)
{
    with (obj_fmod_studio_manager)
    {
        var sound_instance_count = array_length(sound_instances);
        
        if (!is_array(parameters))
        {
            for (var i = 0; i < sound_instance_count; i++)
                func(sound_instances[i]);
            return;
        }
        
        for (var i = 0; i < sound_instance_count; i++) 
        {
            parameters = array_concat([sound_instances[i]], parameters);
            method_call(func, parameters);
        }
    }
}

function fmod_studio_event_instance_start_all()
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_start);
}

function fmod_studio_event_instance_stop_all(mode)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_stop, [mode]);
}

function fmod_studio_event_instance_set_paused_all(pause)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_paused, [pause]);
}

function fmod_studio_event_instance_keyoff_all()
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_keyoff);
}

function fmod_studio_event_instance_set_pitch_all(pitch)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_pitch, [pitch]);
}

function fmod_studio_event_instance_set_property_all(property, value)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_property, [property, value]);
}

function fmod_studio_event_instance_set_timeline_position_all(position)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_timeline_position, [position]);
}

function fmod_studio_event_instance_set_3d_attributes_all(attributes)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_3d_attributes, [attributes]);
}

function fmod_studio_event_instance_set_listener_mask_all(mask)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_listener_mask, [mask]);
}

function fmod_studio_event_instance_set_parameter_by_name_all(name, value, ignore_seek_speed=false)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_parameter_by_name, [name, value, ignore_seek_speed]);
}

function fmod_studio_event_instance_set_parameter_by_name_with_label(name, label, ignore_seek_speed=false)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_parameter_by_name_with_label, [name, label, ignore_seek_speed]);
}

function fmod_studio_event_instance_set_parameter_by_id_all(parameter_id, value, ignore_seek_speed=false)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_parameter_by_id, [parameter_id, value, ignore_seek_speed]);
}

function fmod_studio_event_instance_set_parameter_by_id_with_label_all(parameter_id, label, ignore_seek_speed=false)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_parameter_by_id_with_label, [parameter_id, label, ignore_seek_speed]);
}

function fmod_studio_event_instance_set_reverb_level_all(index, level)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_reverb_level, [index, level]);
}

function fmod_studio_event_instance_set_callback_all(type)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_callback, [type]);
}

function fmod_studio_event_instance_set_user_data(data)
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_set_user_data, [data]);
}

function fmod_studio_event_instance_release_all()
{
    __fmod_studio_event_instance_all__(fmod_studio_event_instance_release);
}