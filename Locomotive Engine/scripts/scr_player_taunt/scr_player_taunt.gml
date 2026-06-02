/// @ignore
function StatePlayerTauntCreate()
{
    stored_sprite_index = sprite_index;
    stored_image_index = image_index;

    stored_vsp = vsp;
    stored_hsp = hsp;
    stored_movespeed = movespeed;
    
    grav = 0;
    vsp = 0;
    hsp = 0;
    movespeed = 0;
    parryHitboxBuffer = 8;
    
    sprite_set(spr_taunt, irandom(sprite_get_number(spr_taunt)));
    create_particle(x, y + 45, obj_taunt_particle);
    
    taunt_timer.Start();
    sound_instance_one_shot(sfx_player_taunt, x, y);
}

/// @ignore
function StatePlayerTauntStep()
{
    if (--parryHitboxBuffer > 0)
        hitboxDoAttack(parryHitbox, "parryEnemy");
}

/// @ignore
function StatePlayerTauntDestroy()
{
    grav = 0.5;
    
    sprite_index = stored_sprite_index;
    image_index = stored_image_index;
    
    vsp = stored_vsp;
    hsp = stored_hsp;
    movespeed = stored_movespeed;
}
