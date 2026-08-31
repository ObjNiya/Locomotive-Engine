/// @ignore
function StatePlayerMachturnCreate()
{
    SpriteSet((PlayerGetMachStage() > 2) ? spr_mach3_turn_intro : spr_mach2_turn_intro, 0);
}

/// @ignore
function StatePlayerMachturnStep()
{
    static dashcloud_part_timer = 14;
    
    movespeed = Approach(movespeed, 0, 0.4);
    hsp = movespeed * dir;
    
    AnimationEndExt((sprite_index == spr_mach2_turn_intro), spr_mach2_turn);
    AnimationEndExt((sprite_index == spr_mach3_turn_intro), spr_mach3_turn);
    
    if (movespeed <= 0 && grounded)
    {
        var mach3 = (EqualsToAny(sprite_index, spr_mach3_turn_intro, spr_mach3_turn));

        dir *= -1;
        movespeed = (mach3) ? 12 : 10;

        image_xscale = dir;
        
        SmcSetState("Mach");
        SpriteSet((mach3) ? spr_mach3 : spr_mach2, 0);
            
        return;
    }
    
    if (dashcloudPartTimer <= 0 && grounded)
    {
        PartSpawnDirX(x, bbox_bottom, PART_TYPES.DASHCLOUD, dir);
        dashcloudPartTimer = 13;
    }
}