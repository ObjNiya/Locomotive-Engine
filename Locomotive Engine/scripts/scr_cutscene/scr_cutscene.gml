/**
 * Creates and starts a video or sequence cutscene.
 * @parameter {String|Asset.GMSequence} video_path_or_sequence A path to the cutscenes video file  **OR** The sequence asset of the cutscene.
 * @parameter {Bool} suspend_game (OPTIONAL) Whether or not to pause the game when the cutscene starts. Default is true.
 * @parameter {Bool} auto_skip (OPTIONAL) Whether or not a skip segment that skips the whole sequence is automatically made. Default is true.
 * @parameter {Bool} loop (OPTIONAL) Whether or not the cutscene should loop. Default is false. Note that if this is true, you will have to manually end the cutscene.
 */
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