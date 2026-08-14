var sine_range = global.baseAppHeight;
var sine_speed_div = sine_range * 2;
var scroll_speed_div = 9;

var pal_index = (image_index > 0) ? global.rank + 1 : 0;
var y_wave = sin(current_time / sine_speed_div) * sine_range;
var x_scroll = current_time / scroll_speed_div;

pal_swap_set(spr_rank_bg_palette, pal_index, false);
draw_sprite_tiled_ext(sprite_index, image_index, x_scroll, y_wave, image_xscale, image_yscale, image_blend, image_alpha);
pal_swap_reset();