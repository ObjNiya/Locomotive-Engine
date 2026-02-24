var type = async_load[? "type"];

if (type == "video_start")
    draw_video = true;
else if (type == "video_end")
{
    draw_video = false;
    
    goto_room();
    video_close();
}