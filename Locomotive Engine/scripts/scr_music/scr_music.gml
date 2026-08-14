global.music = -1; 

/**
 * Sets the music to the given event path and restarts it.
 * @parameter {String} event_path The FMOD Studio event path to the music to play.
 */
function MusicSet(event_path)
{
    if (!sound_description_is_valid_ext(event_path))
    {
        Log(MusicSet, LOG_TYPES.ERROR, "Invalid event path or event description ref! Not setting music.");
        return;
    }
    
    if (global.music == -1 || !sound_instance_is_valid(global.music))
        global.music = sound_instance_create(event_path);
    else
        sound_instance_change(global.music, event_path);
    
    MusicStart();
}


/**
 * Returns the musics volume parameter value.
 */
function MusicGetVolume()
{
    return sound_instance_get_parameter_by_name(global.music, "Volume").value;
}


/**
 * Sets the musics volume parameter to the given value.
 * @parameter {Real} volume The volume to set.
 */
function MusicSetVolume(volume)
{
    sound_instance_set_parameter_by_name(global.music, "Volume", volume).value;
}


/**
 * Returns the musics pitch parameter value.
 */
function MusicGetPitch()
{
    return sound_instance_get_parameter_by_name(global.music, "Pitch");
}


/**
 * Sets the musics pitch parameter to the given value.
 * @parameter {Real} pitch The pitch to set.
 */
function MusicSetPitch(pitch)
{
    sound_instance_set_parameter_by_name(global.music, "Pitch", pitch);
}


/**
 * Returns whether or not music playback is paused.
 */
function MusicGetPaused()
{
    return sound_instance_get_paused(global.music);
}


/**
 * Toggles whether or not the music is paused based on the given boolean.
 * @parameter {Boolean} paused Whether or not to pause the music.
 */
function MusicPause(paused)
{
    sound_instance_set_paused(global.music, paused);
}


/**
 * Returns the musics current playback state.
 */
function MusicGetPlaybackState()
{
    return sound_instance_get_playback_state(global.music);
}


/**
 * Stops playback of music altogether, to be restarted with ```MusicStart()```
 * @parameter {Bool} allow_fadeout Whether or not the music is allowed to fade out. (if it's configured to do so)
 */
function MusicStop(allow_fadeout = true)
{
    sound_instance_stop(global.music, (allow_fadeout) ? FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT : FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}


/**
 * Starts music playback or restarts it if it was already playing.
 */
function MusicStart()
{
    sound_instance_start(global.music);
}