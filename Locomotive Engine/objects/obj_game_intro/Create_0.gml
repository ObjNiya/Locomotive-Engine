depth = DEPTHS.CLOSEST;

var intro_path = "data\\intro.mov";

if (!file_exists(intro_path))
{
    goto_room();
    exit;
}

video_open(intro_path);

draw_video = false;