if (!draw_video)
    exit;

var video_surf = video_draw()[1];
var video_x = (GAME_WIDTH / 2) - (surface_get_width(video_surf) / 2);
var video_y = (GAME_HEIGHT / 2) - (surface_get_height(video_surf) / 2);

draw_surface(video_surf, video_x, video_y);