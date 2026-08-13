event_inherited();

sprite_index = choose(spr_collectable1, spr_collectable2, spr_collectable3, spr_collectable4, spr_collectable5);
if (RANDOMIZE_COLLECTABLE_FRAME_OFFSET)
    image_index = P_Random() % (image_number + 1);