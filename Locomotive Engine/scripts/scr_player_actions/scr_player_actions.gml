function PlayerDoTaunt(forced = false)
{
    if (!InputPressed(INPUT_VERB.TAUNT) && !forced)
        return false;
    
    tauntStoredState = stateName;
    SmcSetState("Taunt");
    return true;
}

function PlayerDoCape(forced = false)
{
    if (!PlayerCape() && !forced)
        return false;
    
    sound_instance_one_shot(sfx_damian_cape_start, x, y);
    FlashEffectSet();
    
    SmcSetState("Cape");
    return true;
}

function PlayerDoGrabdash(forced = false)
{
    if (!PlayerGrabdash() && !forced)
        return false;
    
    create_particle(x, y + 45, obj_burst_cloud_particle);
    SmcSetState("Grabdash");
    return true;
}

function PlayerDoGroundpound(forced = false, divebomb = false)
{
    if (((!PlayerGroundpound() && !divebomb) || (!PlayerDivebomb() && divebomb)) && !forced)
        return false;
    
    SmcSetState("Groundpound");
    
    if (divebomb)
        SpriteSet(spr_divebomb, 0);
    
    return true;
}

function PlayerDoMachslide(forced = false)
{
    if (!PlayerMachslide() && !forced)
        return false;
    
    sound_instance_one_shot(SfxMachBrake, x, y);
    SmcSetState("Machslide");
    
    return true;
}

function PlayerDoMachturn(forced = false)
{
    if (!PlayerMachturn() && !forced)
        return false;
    
    sound_instance_one_shot(SfxMachTurn, x, y);
    SmcSetState("Machturn");
    
    return true;
}

function PlayerDoUppercut(forced = false)
{
    if (!PlayerUppercut() && !forced)
        return false;
    
    sound_instance_one_shot(sfx_player_uppercut, x, y);
    InstanceCreate(x, y + 45, obj_jump_particle);
    
    SmcSetState("Uppercut");
    return true;
}

function PlayerDoLadder()
{
    var ladder = instance_place(x, y, obj_ladder);
    var ladder_below = instance_place(x, y + 1, obj_ladder);
    
    if (!instance_exists(ladder) && !instance_exists(ladder_below))
        return false;
    
    var sign_input_y = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    
    if (instance_exists(ladder_below) && !place_meeting(x, y + 1, obj_solid) && sign_input_y == 1 && grounded)
    {
        y++;
        ladderId = ladder_below;
        x = (ladderId.x - ladderId.sprite_xoffset) + (ladderId.sprite_width / 2);
        
        SmcSetState("Ladder");
        sprite_index = spr_ladder_down;
        
        return true;
    }
    
    if (instance_exists(ladder) && sign_input_y == -1)
    {
        ladderId = ladder;
        x = (ladderId.x - ladderId.sprite_xoffset) + (ladderId.sprite_width / 2);
        
        SmcSetState("Ladder");
        sprite_index = spr_ladder_up;
        
        return true;
    }
    
    return false;
}

function PlayerDoWallsplat(forced = false)
{
    if (!PlayerHitWall() && !forced)
        return false;
    
    SmcSetState("Anim");
    sound_instance_one_shot(sfx_player_wall_splat, x, y);
    SpriteSet(spr_wallsplat, 0);
            
    vsp = 0;
    grav = 0;
    
    return true;
}

function PlayerDoCeilingsplat(forced = false)
{
    if (!PlayerHitCeiling() && !forced)
        return false;
        
    SmcSetState("Anim");
    sound_instance_one_shot(sfx_player_groundpound_land, x, y);
    SpriteSet(spr_sjump_hit_ceiling, 0);
            
    vsp = 0;
    grav = 0;
    
    return true;
}

function PlayerDoJump(forced = false, sprite_to_set = spr_jump, jump_height = -11, particle = true)
{
    if (!PlayerJump() && !forced)
        return false;
    
    CoyoteTimeJump();
    SpriteSet(sprite_to_set, 0);
    
    if (particle)
        InstanceCreate(x, y + 45, obj_jump_particle);
    
    sound_instance_one_shot(SfxJump, x, y);
    
    vsp = jump_height;
    
    return true;
}

function PlayerDoLongjump(forced = false, jump_height = -11)
{
    if (!PlayerJump() && !forced)
        return false;
    
    CoyoteTimeJump();
    SmcSetState("Mach");
    SpriteSet(spr_longjump_intro, 0);
    InstanceCreate(x, y + 45, obj_jump_particle);
    
    sound_instance_start(sndRollGetup);
    
    movespeed = max(movespeed, 10);
    vsp = jump_height;
    
    return true;
}

function PlayerDoJumpstop(forced = false, divisor = 20)
{
    if ((!InputReleased(INPUT_VERB.JUMP) || vsp >= 0 || grounded) && !forced)
        return false;
    
    vsp /= divisor;
    
    return true;
}

function PlayerDoInstakill()
{
    var hurt_enemy = HitboxPlace(instakillHitbox, par_enemy, "hurtbox");
    if (hurt_enemy == noone)
        return false;
  
    camera.shake_set(3, 0.05);
    sound_instance_one_shot(sfx_player_punch, x, y);
    HitstunSet(5);
    
    InstanceCreate(hurt_enemy.x, hurt_enemy.y, obj_parry_particle);
    InstanceCreate(hurt_enemy.x, hurt_enemy.y, obj_kungfu_particle);
    
    repeat (3)
        InstanceCreate(x, y, obj_slap_star_debris);
    
    repeat (3)
        InstanceCreate(x, y, obj_enemy_debris);
    
    AttackEnemy(hurt_enemy, id);
    return true;
}