function CreateCutscene(video_path_or_sequence, suspend_game = true, auto_skip = true, loop = false)
{
    var obj = (is_string(video_path_or_sequence)) ? obj_video_cutscene : obj_seq_cutscene;
    
    with (InstanceCreate(0, 0, obj))
    {
        if (obj == obj_video_cutscene)
            videoPath = video_path_or_sequence;
        else
            sequence = video_path_or_sequence;
        
        suspendGame = suspend_game;
        autoSkip = auto_skip;
        self.loop = loop;
        
        return id;
    }
}