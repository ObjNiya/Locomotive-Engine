function visual_helper_initialize()
{
    visual_x = 0;
    visual_y = 0;
    
    visual_xscale = 1;
    visual_yscale = 1;
    visual_angle = 0;
}

function visual_helper_draw_self()
{
    draw_sprite_ext(sprite_index, image_index, x + visual_x, y + visual_y, image_xscale * visual_xscale, image_yscale * visual_yscale, image_angle + visual_angle, image_blend, image_alpha * visible); 
}