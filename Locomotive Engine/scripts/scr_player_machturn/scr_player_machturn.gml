/// @ignore
function StatePlayerMachturnCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    sprite_set((player_get_mach_stage() > 2) ? spr_mach3_turn_intro : spr_mach2_turn_intro, 0);
}

/// @ignore
function StatePlayerMachturnStep()
{
    movespeed = approach(movespeed, 0, 0.4);
    hsp = movespeed * dir;
    
    animation_end_ext((sprite_index == spr_mach2_turn_intro), spr_mach2_turn);
    animation_end_ext((sprite_index == spr_mach3_turn_intro), spr_mach3_turn);
    
    if (movespeed <= 0 && grounded)
    {
        var mach3 = (EqualsToAny(sprite_index, spr_mach3_turn_intro, spr_mach3_turn));

        dir *= -1;
        movespeed = (mach3) ? 12 : 10;
        
        image_xscale = dir;
        
        SmcSetState("Mach");
        sprite_set((mach3) ? spr_mach3 : spr_mach2, 0);
            
        return;
    }
    
    if (grounded)
        create_particle_repeating(x, y + 45, obj_machturn_particle);
}