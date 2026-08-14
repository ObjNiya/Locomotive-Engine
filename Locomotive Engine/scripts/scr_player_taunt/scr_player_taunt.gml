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
    
    invincibleBuffer = 8;
    parryHitboxBuffer = 8;
    
    SpriteSet(spr_taunt, irandom(sprite_get_number(spr_taunt)));
    create_particle(x, y + 45, obj_taunt_particle);
    
    sound_instance_one_shot(sfx_player_taunt, x, y);
}

/// @ignore
function StatePlayerTauntStep()
{
    if (--parryHitboxBuffer > 0)
        HitboxDoAttack(parryHitbox, "parryEnemy");

    if (--tauntTimer > 0)
        return;
    
    SmcSetState(stateHistory[$ "tauntStoredState"]);
    SmcDeleteFromHistory("tauntStoredState");
}

/// @ignore
function StatePlayerTauntDestroy()
{
    grav = 0.5;
    
    sprite_index = storedSpriteIndex;
    image_index = storedImageIndex;
    
    vsp = storedVsp;
    hsp = storedHsp;
    movespeed = storedMovespeed;
}
