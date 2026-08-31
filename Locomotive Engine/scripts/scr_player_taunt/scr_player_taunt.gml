/// @ignore
function StatePlayerTauntCreate()
{
    storedSpriteIndex = sprite_index;
    storedImageIndex = image_index;

    storedVsp = vsp;
    storedHsp = hsp;
    storedMovespeed = movespeed;
    
    grav = 0;
    vsp = 0;
    hsp = 0;
    movespeed = 0;
    
    parryHitboxBuffer = 8;
    
    with (hitbox)
    {
        x = other.x;
        y = other.y;
        mask_index = spr_parryhitbox;
    }
    
    SpriteSet(spr_taunt, M_RandomInt(sprite_get_number(spr_taunt)));
    tauntsparkId = layer_sprite_create(PriorityGetLay(spr_tauntspark_effect), x, y, spr_tauntspark_effect); 
    
    sound_instance_one_shot(sfx_player_taunt, x, y);
}

/// @ignore
function StatePlayerTauntStep()
{
    if (--parryHitboxBuffer <= 0)
        hitbox.mask_index = spr_player_mask;

    if (--tauntTimer > 0)
        return;
    
    SmcSetState(tauntStoredState);
}

/// @ignore
function StatePlayerTauntDestroy()
{
    hitbox.mask_index = spr_player_mask;
    grav = 0.5;
    tauntTimer = 18;
    
    sprite_index = storedSpriteIndex;
    image_index = storedImageIndex;
    
    vsp = storedVsp;
    hsp = storedHsp;
    movespeed = storedMovespeed;
    
    layer_sprite_destroy(tauntsparkId);
}
