function visual_helper_initialize()
{
    visual_x = 0;
    visual_y = 0;
    
    visual_xscale = 1;
    visual_yscale = 1;
    visual_angle = 0;
}

function vh_draw_sprite_ext(sprite, subimg, x, y, xscale, yscale, rot, colour, alpha)
{
    draw_sprite_ext(sprite, subimg, x + visual_x, y + visual_y, xscale * visual_xscale, yscale * visual_yscale, rot + visual_angle, colour, alpha);
}

function vh_draw_self()
{
    vh_draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}