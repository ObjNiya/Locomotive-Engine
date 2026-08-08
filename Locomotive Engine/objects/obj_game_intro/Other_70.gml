var type = async_load[? "type"];

if (type == "video_start")
    draw_video = true;
else if (type == "video_end")
{
    draw_video = false;
    
    InstanceCreate(0, 0, obj_file_select);
    instance_destroy();
    video_close();
}