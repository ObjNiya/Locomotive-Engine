if (!canCollide())
{
    x = 0 - sprite_width; 
    y = 0 - sprite_height;
}

sprite_index = (canCollide()) ? spr_patrickblock_on : spr_patrickblock_off;