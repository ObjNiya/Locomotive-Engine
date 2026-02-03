draw_set_mask(spr_tv_turnon_damian, 0, x, y, false);

var x_offset = xstart + x;
var y_offset = ystart - y;

for (var i = 0; i < sprite_get_number(tvbg_sprite); i++)
{
    with (par_player)
        other.tvbg_scroll += -hsp / 10;
    
    var parrallax = (sprite_get_number(tvbg_sprite) - i) + 1;
    
    draw_sprite_tiled(tvbg_sprite, i, (tvbg_scroll / parrallax) - x_offset, -y_offset);
}

draw_reset_mask();

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
whitenoise.draw();