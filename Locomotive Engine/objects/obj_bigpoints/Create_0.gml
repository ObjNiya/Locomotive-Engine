event_inherited();

sprite_index = choose(spr_collectable_big1, spr_collectable_big2, spr_collectable_big3, spr_collectable_big4, spr_collectable_big5);
if (RANDOMIZE_COLLECTABLE_FRAME_OFFSET)
    image_index = P_Random() % (image_number + 1);

value = 100;