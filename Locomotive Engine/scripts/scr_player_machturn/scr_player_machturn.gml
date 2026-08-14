/// @ignore
function StatePlayerMachturnCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    SpriteSet((PlayerGetMachStage() > 2) ? spr_mach3_turn_intro : spr_mach2_turn_intro, 0);
}

/// @ignore
function StatePlayerMachturnStep()
{
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
    
    if (grounded)
        create_particle_repeating(x, y + 45, obj_machturn_particle);
}