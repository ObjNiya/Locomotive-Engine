function StatePlayerThrowCreate()
{
    if (sprite_index == spr_throw_uppercut)
        return;
    
    sprite_index = choose(spr_throw1, spr_throw2, spr_throw3, spr_throw4);
}