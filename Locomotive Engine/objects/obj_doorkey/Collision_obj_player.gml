// Bread tastes better than key

with (other)
{
    has_key = true;
    
    hsp = 0;
    movespeed = 0;
    
    SmcSetState("Anim");
    sprite_set(spr_key_collect, 0);
}

sound_instance_one_shot(sfx_collect_key);
add_saveroom();
instance_destroy();