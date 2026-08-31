/**
 * Makes the current player instance taunt if the taunt key is pressed, or it's being forced. Returns if the player has taunted or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and taunt anyway. Default is false.
 */
function PlayerDoTaunt(forced = false)
{
    if (!InputPressed(INPUT_VERB.TAUNT) && !forced)
        return false;
    
    tauntStoredState = stateName;
    SmcSetState("Taunt");
    return true;
}


/**
 * Makes the current player instance fly with the cape if the superjump key is pressed and the player is at mach 3+, or it's being forced. Returns if the player has started flying with the cape or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and fly with the cape anyway. Default is false.
 */
function PlayerDoCape(forced = false)
{
    if (!PlayerCape() && !forced)
        return false;
    
    sound_instance_one_shot(sfx_damian_cape_start, x, y);
    FlashEffectSet();
    
    SmcSetState("Cape");
    return true;
}


/**
 * Makes the current player instance grabdash if the grab key is pressed, or it's being forced. Returns if the player has grabdashed or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and grabdash anyway. Default is false.
 */
function PlayerDoGrabdash(forced = false)
{
    if (!PlayerGrabdash() && !forced)
        return false;
    
    PartSpawnDirX(x, bbox_bottom, PART_TYPES.STARTCLOUD, image_xscale);
    SmcSetState("Grabdash");
    return true;
}


/**
 * Makes the current player instance groundpound if the groundpound key is pressed and they're off the ground, or it's being forced. Returns if the player has groundpounded or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and groundpound anyway. Default is false.
 */
function PlayerDoGroundpound(forced = false, divebomb = false)
{
    if (((!PlayerGroundpound() && !divebomb) || (!PlayerDivebomb() && divebomb)) && !forced)
        return false;
    
    SmcSetState("Groundpound");
    
    if (divebomb)
        SpriteSet(spr_divebomb, 0);
    
    return true;
}


/**
 * Makes the current player instance machslide if the mach run key is released and their speed is greater than 8, or it's being forced. Returns if the player has machslid or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and machslide anyway. Default is false.
 */
function PlayerDoMachslide(forced = false)
{
    if (!PlayerMachslide() && !forced)
        return false;
    
    sound_instance_one_shot(sfxMachBrake, x, y);
    SmcSetState("Machslide");
    
    return true;
}


/**
 * Makes the current player instance machturn if the opposite direction is pressed and their speed is greater than 8, or it's being forced. Returns if the player has machturned or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and machturn anyway. Default is false.
 */
function PlayerDoMachturn(forced = false)
{
    if (!PlayerMachturn() && !forced)
        return false;
    
    sound_instance_one_shot(sfxMachTurn, x, y);
    SmcSetState("Machturn");
    
    return true;
}


/**
 * Makes the current player instance uppercut if the up and grabdash key are pressed, or it's being forced. Returns if the player has taunted or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and taunt anyway. Default is false.
 */
function PlayerDoUppercut(forced = false)
{
    if (!PlayerUppercut() && !forced)
        return false;
    
    sound_instance_one_shot(sfx_player_uppercut, x, y);
    PartSpawn(x, bbox_bottom, PART_TYPES.JUMPCLOUD);
    
    SmcSetState("Uppercut");
    return true;
}


/**
 * Makes the current player instance climb up a ladder if the up or down key is pressed and is near a ladder, or it's being forced. Returns if the player has grabbed onto the ladder or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and grab onto the ladder anyway. Default is false.
 */
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


/**
 * Makes the current player instance wallsplat if they hit a wall, or it's being forced. Returns if the player has wallsplatted or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and wallsplat anyway. Default is false.
 */
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


/**
 * Makes the current player instance ceilingplat if they hit a ceiling, or it's being forced. Returns if the player has ceilingplat or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and ceilingplat anyway. Default is false.
 */
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


/**
 * Makes the current player instance jump if the jump key is pressed and they're on the ground, or it's being forced. Returns if the player has jumped or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and jump anyway. Default is false.
 * @parameter {Asset.GMSprite} sprite_to_set (OPTIONAL) Which sprite to set if the player jumps. Default is spr_jump.
 * @parameter {Real} jump_height (OPTIONAL) How high the player should jump. Default is -11.
 * @parameter {Bool} particle (OPTIONAL) Whether or not to spawn a particle if the player jumps. Default is true.
 */
function PlayerDoJump(forced = false, sprite_to_set = spr_jump, jump_height = -11, particle = true)
{
    if (!PlayerJump() && !forced)
        return false;
    
    CoyoteTimeJump();
    SpriteSet(sprite_to_set, 0);
    
    if (particle)
        PartSpawn(x, bbox_bottom, PART_TYPES.JUMPCLOUD);
    
    sound_instance_one_shot(sfxJump, x, y);
    
    vsp = jump_height;
    
    return true;
}


/**
 * Makes the current player instance longjump if the jump key is pressed and they're on the ground, or it's being forced. Returns if the player has longjumped or not.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and longjump anyway. Default is false.
 * @parameter {Real} jump_height (OPTIONAL) How high the player should longjump. Default is -11.
 */
function PlayerDoLongjump(forced = false, jump_height = -11)
{
    if (!PlayerJump() && !forced)
        return false;
    
    CoyoteTimeJump();
    SmcSetState("Mach");
    SpriteSet(spr_longjump_intro, 0);
    PartSpawn(x, bbox_bottom, PART_TYPES.JUMPCLOUD);
    
    sound_instance_start(sndRollGetup);
    
    movespeed = max(movespeed, 10);
    vsp = jump_height;
    
    return true;
}


/**
 * Makes the current player instance stop their upwards jump momentum if the jump key is released, or if it's being forced. Returns if the upwards jumping momentum has been stopped.
 * @parameter {Bool} forced (OPTIONAL) Whether or not to ignore the check and force the player to stop their upwards jumping momentum. Default is false.
 * @parameter {Real} divisor (OPTIONAL) By how much to divide the players veritcal speed to stop their upwards jumping momentum. Default is 20.
 */
function PlayerDoJumpstop(forced = false, divisor = 20)
{
    if ((!InputReleased(INPUT_VERB.JUMP) || vsp >= 0 || grounded) && !forced)
        return false;
    
    vsp /= divisor;
    
    return true;
}


/**
 * Makes the current player instance instantly kill any enemies they touch, or the enemy that is given. Returns if an enemy was killed or not.
 * @parameter {Id.Instance} enemy_to_kill (OPTIONAL) Which enemy to kill. Default is noone, making the function search for collision with another enemy.
 */
function PlayerDoInstakill(enemy_to_kill = noone)
{
    if (enemy_to_kill == noone)
        enemy_to_kill = HitboxPlace(instakillHitbox, par_enemy, "hurtbox");
    if (enemy_to_kill == noone || enemy_to_kill == carryingId)
        return false;
  
    camera.ShakeSet(3, 0.05, 0);
    sound_instance_one_shot(sfx_playerpunch, x, y);
    HitstunSet(5);
    
    with (enemy_to_kill)
    {
        PartSpawn(x, y, PART_TYPES.PUFF);
        PartSpawn(x, y, PART_TYPES.PARRYSPARK);
        PartSpawn(x, y, PART_TYPES.SPARK);
    }
    
    PartSpawn(x, y, PART_TYPES.SLAPSTARS_DEBRIS, 0, 0, ps_shape_rectangle, ps_distr_linear, false, 3);
    PartSpawn(x, y, PART_TYPES.ENEMY_DEBRIS, 0, 0, ps_shape_rectangle, ps_distr_linear, false, 3);
    
    AttackEnemy(enemy_to_kill, id);
    if (InputCheck(INPUT_VERB.JUMP))
        vsp = -11;
    
    return true;
}