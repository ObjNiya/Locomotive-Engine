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
    var x_pos = (sign(hsp) == 1) ? ceil(x + hsp) : floor(x + hsp);
    BlocksDestroy(x_pos, y, true, false, [obj_metalblock]);
    
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