draw_sprite_ext(sprite_index, image_index, 0, 0, global.guiMaxScale * image_xscale, global.guiMaxScale * image_yscale, image_angle, image_blend, image_alpha);
if (round(image_index) <= 0)
    instance_destroy();