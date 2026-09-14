global.level.prlxInit();
if (room == global.level.firstRm && MusicGetPlaybackState() != FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
    MusicSet(global.level.music);