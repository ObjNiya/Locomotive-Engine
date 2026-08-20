if (room == global.level.firstRm && MusicGetPlaybackState() == FMOD_STUDIO_PLAYBACK_STATE.STOPPED)
    MusicSet(global.level.music);