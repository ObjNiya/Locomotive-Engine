with (global)
{
    draw_sprite_ext(spr_titlecards, level.titlecardIndex, 0, 0, guiMaxScale, guiMaxScale, 0, other.image_blend, other.image_alpha);
    draw_sprite_ext(spr_titlecards_title, level.titlecardIndex, M_RandomSign(1), M_RandomSign(1), guiMaxScale, guiMaxScale, 0, other.image_blend, other.image_alpha);
}

with (obj_roomtrans_fade)
{
    draw_set_color(image_blend);
    draw_set_alpha(image_alpha);
    draw_rectangle(0, 0, GuiCalcX(fa_right), GuiCalcY(fa_bottom), false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}