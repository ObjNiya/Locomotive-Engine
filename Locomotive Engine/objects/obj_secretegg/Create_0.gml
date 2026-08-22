player = noone;
palIndex = M_RandomInt(sprite_get_width(spr_secretegg_palette));

DESTROY_SAVEROOM;

if (place_meeting_collision(x, y))
    visible = false;