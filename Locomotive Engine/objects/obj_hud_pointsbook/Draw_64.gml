for (var i = 0; i < array_length(collectable_effect_array); i++)
{
    with (collectable_effect_array[i])
    {
        var target_angle = point_direction(x, y, other.points_text_x, other.points_text_y);
        
        x += lengthdir_x(16, target_angle);
        y += lengthdir_y(16, target_angle);
        
        if (point_distance(x, y, other.points_text_x, other.points_text_y) <= 16)
        {
            add_points(value);
            array_delete(other.collectable_effect_array, i, 1);
            
            other.y_offset = 128;
            i = 0;
        }
        
        draw();
    }
}

draw_self();


for (var i = 0; i < array_length(stickers); i++)
{
    draw_sprite(stickers[i].sprite_index, stickers[i].image_index, stickers[i].x, stickers[i].y);
}

draw_set_font(global.pointsbookfont);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

with (obj_level_manager)
    draw_text(other.points_text_x, other.points_text_y, string(points));

draw_set_halign(fa_left);
draw_set_valign(fa_top);