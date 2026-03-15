function set_music(event_path)
{
    if (!sound_description_is_valid_ext(event_path))
        return false;
   
    if (!sound_instance_is_valid(global.music))
        global.music = sound_instance_create(event_path);
    else
        global.music = sound_instance_change(global.music, event_path, true);
    
    sound_instance_start(global.music);
}

function stop_music(allow_fadeout = true)
{
    sound_instance_stop(global.music, (allow_fadeout) ? FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT : FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}