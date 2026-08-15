with (global)
{
    if (levelTimer.state != TIMER_STATES.STARTED)
        levelTimer.Start();
    if (room == global.level.firstRm && MusicGetPlaybackState() == FMOD_STUDIO_PLAYBACK_STATE.STOPPED)
        MusicSet(level.music);
}

