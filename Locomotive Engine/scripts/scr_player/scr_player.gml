#macro PLAYER_STATE_FAILSAVE if (object_index != obj_player) { SmcSetState("None") Log(object_index, LOG_TYPES.WARNING, "Attempted to enter a player state despite not being a player! Setting state to none...") return }

/**
 * This function will attack the given Player, meant to be exclusively called by obj_hitbox.
 * @parameter {Instance.Id} player Which Player instance to attack.
 * @parameter {Instance.Id} attacker_id The instance that Player was attacked by.
 */
function AttackPlayer(player, attacker_id)
{
    if (player.object_index != obj_player)
        return;
    
    with (player)
    {
        if (stateName == "Hurt")
            return;
        
        var old_xscale = image_xscale;
        
        if (x != attacker_id.x)
            image_xscale = sign(attacker_id.x - x);
        dir = image_xscale;
        
        Sleep(100);
        SmcSetState("Hurt");
        
        if (old_xscale == -image_xscale)
            sprite_index = spr_back_hurt;
        
        if (irandom(100) <= 50)
            sound_instance_one_shot(SfxVoiceHurt, x, y);
        
        InstanceCreate(x, y, obj_bang_particle);
        InstanceCreate(x, y, obj_hurt_stars_particle);
        
        repeat (5)
            InstanceCreate(x, y, obj_hurt_star_debris);
        
        global.points -= max(global.points - 50, 0);
    }
}

enum PLAYER_HURT_STATUS
{
    FAILED,
    PARRIED,
    SUCCESS,
}

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