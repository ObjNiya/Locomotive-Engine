depth = DEPTHS.CLOSEST;

queue_room(rm_title_screen, -1);

var intro_path = "data\\intro.mp4";

if (!file_exists(intro_path))
{
    goto_room();
    exit;
}

video_open(intro_path);

draw_video = false;