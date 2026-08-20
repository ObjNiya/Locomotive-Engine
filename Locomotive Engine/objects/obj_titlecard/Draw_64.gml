with (global)
{
    draw_sprite_ext(spr_titlecards, level.titlecardIndex, 0, 0, guiMaxScale, guiMaxScale, 0, other.image_blend, other.image_alpha);
    draw_sprite_ext(spr_titlecards_title, level.titlecardIndex, M_RandomSign(1), M_RandomSign(1), guiMaxScale, guiMaxScale, 0, other.image_blend, other.image_alpha);
}