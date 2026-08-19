enum PLAYER_HURT_STATUS
{
    FAILED,
    PARRIED,
    SUCCESS,
}

/**
 * Tries to hurt the given player instance. Returns a ```PLAYER_HURT_STATUS``` enum member based on if the given player was hurt or not, or if the given player parried the attack.
 * @parameter {Id.Instance} player_id The player instance to try and hurt.
 * @parameter {Id.Instance} attacker_id The instance the player was hurt by.
 */
function TryHurtPlayer(player_id, attacker_id)
{
    with (player_id)
    {
        if (object_index != obj_player)
            return PLAYER_HURT_STATUS.FAILED;
        
        if (stateName == "Taunt" && parryHitboxBuffer > 0)
        { 
            parryTarget = attacker_id;
            
            SmcSetState("Parry");
            InstanceDestroySafe(obj_taunt_particle);
            sound_instance_one_shot(sfx_player_parry, x, y);
            
            return PLAYER_HURT_STATUS.PARRIED;
        }
        
        if (stateName == "Hurt" || invincibilityTime > 0)
            return PLAYER_HURT_STATUS.FAILED;

        
        var old_xscale = image_xscale;
        if (x != attacker_id.x)
            image_xscale = sign(attacker_id.x - x);
        
        dir = image_xscale;
        
        Sleep(100);
        SmcSetState("Hurt");
        
        if (old_xscale == -image_xscale)
            sprite_index = spr_back_hurt;
        
        if (M_RandomInt(100) <= 50)
            sound_instance_one_shot(SfxVoiceHurt, x, y);
        
        InstanceCreate(x, y, obj_bang_particle);
        InstanceCreate(x, y, obj_hurt_stars_particle);
        
        repeat (5)
            InstanceCreate(x, y, obj_hurt_star_debris);
        
        global.points -= max(global.points - 50, 0);
    }
}