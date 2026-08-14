/// @ignore
function StatePlayerMachslideCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    SpriteSet(spr_machslide_intro, 0);
}

/// @ignore
function StatePlayerMachslideStep()
{
    movespeed = Approach(movespeed, 0, 0.4);
    hsp = movespeed * dir;
    
    HitboxDoAttack(hitbox, "stunEnemy");
    
    destroy_blocks(x + hsp, y, [obj_block_metal, obj_block_metal_tiles]);
    
    if (movespeed <= 0)
    {
        SmcSetState("Normal");
        SpriteSet(spr_machslide_end, 0);
        
        return;
    }
    
    if (PlayerDoWallsplat())
        return;
    
    AnimationEndExt((sprite_index == spr_machslide_intro), spr_machslide);
    
    if (grounded)
        create_particle_repeating(x, y + 45, obj_machturn_particle);
}