if (instance_exists(spawner_id) && use_alpha)
    image_alpha = abs(spawner_id.hsp) / 12;
else
    image_alpha = 1;

draw_self();

pal_swap_set(spr_mach_afterimage_palette_damian, palette_cycle, false);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 0.6 * image_alpha);
pal_swap_reset();