// Bread tastes better than key

with (other)
{
    hasKey = true;
    
    hsp = 0;
    movespeed = 0;
    
    SmcSetState("Anim");
    SpriteSet(spr_key_collect, 0);
}

sound_instance_one_shot(sfx_collectkey);
SaveroomAdd();
instance_destroy();