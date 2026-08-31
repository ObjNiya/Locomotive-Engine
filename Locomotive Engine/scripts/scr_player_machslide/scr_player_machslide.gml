/// @ignore
function StatePlayerMachslideCreate()
{
    
    
    SpriteSet(spr_machslide_intro, 0);
}

/// @ignore
function StatePlayerMachslideStep()
{
    static dashcloud_part_timer = 14;
    
    movespeed = Approach(movespeed, 0, 0.4);
    hsp = movespeed * dir;
    
    StunEnemy(HitboxPlace(hitbox, par_enemy, "hurtbox"), self);
    
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
    
    if (dashcloudPartTimer <= 0)
    {
        PartSpawnDirX(x, bbox_bottom, PART_TYPES.DASHCLOUD, dir);
        dashcloudPartTimer = 13;
    }
}