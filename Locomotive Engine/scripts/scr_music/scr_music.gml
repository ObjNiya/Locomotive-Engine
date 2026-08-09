global.music = -1; 
global.musicOverlays = {};

function MusicOverlay(name, event_path, pause_base_music, priority, activate_on, fade_speed = 0.05) constructor 
{
    self.name = name;
    pauseBaseMus = pause_base_music;
    self.priority = priority;
    activateOn = activate_on;
    fadeSpd = fade_speed;
   
    event = sound_instance_create(event_path);
    sound_instance_start(event);
    sound_instance_set_parameter_by_name(event, "Volume", 0, true);
    
    static Remove = function()
    {
        sound_instance_kill(event, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
        struct_remove(global.musicOverlays, name);
        
        if (obj_music.overlay.name == name)
            obj_music.overlay = -1;
    }
    
    global.musicOverlays[$ self.name] = self;
}

function SetMusic(event_path, volume = 1, pitch = 1)
{
    if (!sound_description_is_valid_ext(event_path))
    {
        Log(SetMusic, LOG_TYPES.ERROR, "Invalid event path or event description ref! Not setting music.");
        return;
    }
    
    if (global.music == -1 || !sound_instance_is_valid(global.music))
        global.music = sound_instance_create(event_path);
    else
        sound_instance_change(global.music, event_path);
    
    sound_instance_set_parameter_by_name(global.music, "Volume", volume, true);
    sound_instance_set_parameter_by_name(global.music, "Pitch", pitch, true);
    StartMusic();
}

function PauseMusic(paused)
{
    sound_instance_set_paused(global.music, paused);
}

function StopMusic(allow_fadeout = true)
{
    sound_instance_stop(global.music, (allow_fadeout) ? FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT : FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}

function StartMusic()
{
    sound_instance_start(global.music);
}