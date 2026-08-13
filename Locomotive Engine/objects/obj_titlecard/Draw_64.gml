with (global)
{
    draw_sprite_ext(spr_titlecards, level.title_index, 0, 0, guiMaxScale, guiMaxScale, 0, other.image_blend, other.image_alpha);
    
    var shake_x = M_Random() % 3;
    if (shake_x >= 2) 
        shake_x = -1;
    var shake_y = M_Random() % 3;
    if (shake_y)
        shake_y = -1;
    
    draw_sprite_ext(spr_titlecards_title, level.title_index, shake_x, shake_y, guiMaxScale, guiMaxScale, 0, other.image_blend, other.image_alpha);
}