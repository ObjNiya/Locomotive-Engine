event_inherited();

videoType = -1;

setCutscenePos = function(pos)
{
    video_seek_to(pos);
}

getCutsceneLen = function()
{
    return video_get_duration();
}

getCutscenePos = function()
{
    return video_get_position();
}

performSkip = function(skip_ms)
{
    if (getCutsceneLen() >= skip_ms)
    {
        instance_destroy();
        exit;
    }
    
    video_seek_to(skip_ms);
}