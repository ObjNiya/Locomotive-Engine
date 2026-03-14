with (obj_player)
{
    var top_y = y - sprite_height + sprite_yoffset;
    
    draw_sprite_ext(spr_input_icons_bg, 0, x, top_y, other.image_xscale, other.image_yscale, other.image_angle, other.image_blend, other.image_alpha);
    draw_sprite_ext(spr_keyboard_icons, 0, x, top_y, other.image_xscale, other.image_yscale, other.image_angle, other.image_blend, other.image_alpha);
    
    var text_xoffset = sprite_get_xoffset(spr_keyboard_icons);
    var text_yoffset = sprite_get_yoffset(spr_keyboard_icons);
    
    var binding = InputBindingGet(false, other.input_verb);
    binding = InputGetBindingName(binding, false);
    
    draw_set_font(global.signfont);
    draw_set_color(c_black);
    draw_text(x - text_xoffset, top_y - text_yoffset, binding);
    draw_set_color(c_white);
}
