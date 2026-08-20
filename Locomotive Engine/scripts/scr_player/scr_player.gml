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
            sound_instance_one_shot(sfx_playerparry, x, y);
            
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
            sound_instance_one_shot(sfxVoiceHurt, x, y);
        
        InstanceCreate(x, y, obj_bang_particle);
        InstanceCreate(x, y, obj_hurt_stars_particle);
        
        repeat (5)
            InstanceCreate(x, y, obj_hurt_star_debris);
        
        global.points -= max(global.points - 50, 0);
    }
}


function PlayerCreateSnds()
{
    if (sndsInitialized)
        exit;
    QuickLog("Creating sounds for ", id)
    sfxStep = CharGetSnd(sfx_damian_step, character);
    sfxJump = CharGetSnd(sfx_damian_jump, character);
    sfxMach = CharGetSnd(sfx_damian_mach, character);
    sfxMachTurn = CharGetSnd(sfx_damian_mach_turn, character);
    sfxMachBrake = CharGetSnd(sfx_damian_mach_brake, character);
    sfxVoiceIdle = CharGetSnd(sfx_damianvoice_idle, character);
    sfxVoiceHappy = CharGetSnd(sfx_damianvoice_happy, character);
    sfxVoiceHurt = CharGetSnd(sfx_damianvoice_hurt, character);
    sfxVoicePlushie = CharGetSnd(sfx_damianvoice_plushie, character);
    sfxVoiceCatripi = CharGetSnd(sfx_damianvoice_catripi, character);
    
    sndGrabdash = sound_instance_create(sfx_player_grabdash);
    sndGroundpound = sound_instance_create(sfx_player_groundpound);
    sndMach = sound_instance_create(sfxMach);
    sndSuperjump = sound_instance_create(sfx_player_sjump);
    
    sndMachroll = sound_instance_create(sfx_player_machroll);
    sndDive = sound_instance_create(sfx_player_dive);
    sndRollGetup = sound_instance_create(sfx_player_rollgetup);
    sndSpin = sound_instance_create(sfx_playerspin);
    
    sndsInitialized = true;
}

function PlayerDestroySnds()
{
    if (!sndsInitialized)
        exit;
    
    sound_instance_kill(sndGrabdash);
    sound_instance_kill(sndGroundpound);
    sound_instance_kill(sndMach);
    sound_instance_kill(sndSuperjump);
    
    sound_instance_kill(sndMachroll);
    sound_instance_kill(sndDive);
    sound_instance_kill(sndRollGetup);
    sound_instance_kill(sndSpin);
    
    sndsInitialized = false;
}