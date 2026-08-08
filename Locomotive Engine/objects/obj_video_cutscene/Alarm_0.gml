if (!file_exists(videoPath))
{
    Log(obj_video_cutscene, LOG_TYPES.ERROR, "The given video doesn't exist! Cancelling cutscene.")
    instance_destroy();
    exit;
}

video_open(videoPath);
video_enable_loop(loop);
videoType = video_get_format();

event_inherited();