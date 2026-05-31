function player_do_cape(forced = false)
{
    if (!PlayerCape() && !forced)
        return false;
    
    sound_instance_one_shot(sfx_damian_cape_start, x, y);
    create_flash_effect(true);
    
    smc_set_state(state_player_cape);
    return true
}

function player_do_grabdash(forced = false)
{
    if (!PlayerGrabdash() && !forced)
        return false;
    
    create_particle(x, y + 45, obj_burst_cloud_particle);
    smc_set_state(state_player_grabdash);
    return true
}

function player_do_groundpound(forced = false, divebomb = false)
{
    if (((!PlayerGroundpound() && !divebomb) || (!PlayerDivebomb() && divebomb)) && !forced)
        return false;
    
    smc_set_state(state_player_groundpound);
    
    if (divebomb)
        sprite_set(spr_divebomb, 0);
    
    return true
}

function player_do_machslide(forced = false)
{
    if (!PlayerMachslide() && !forced)
        return false;
    
    sound_instance_one_shot(sfx_mach_brake, x, y);
    smc_set_state(state_player_machslide);
    
    return true
}

function player_do_machturn(forced = false)
{
    if (!PlayerMachturn() && !forced)
        return false;
    
    sound_instance_one_shot(sfx_mach_turn, x, y);
    smc_set_state(state_player_machturn);
    
    return true
}

function player_do_uppercut(forced = false)
{
    if (!PlayerUppercut() && !forced)
        return false;
    
    sound_instance_one_shot(sfx_player_uppercut, x, y);
    instance_create(x, y + 45, obj_jump_particle);
    
    smc_set_state(state_player_uppercut);
    return true
}

function player_do_ladder()
{
    var ladder = instance_place(x, y, obj_ladder);
    var ladder_below = instance_place(x, y + 1, obj_ladder);
    
    if (!instance_exists(ladder) && !instance_exists(ladder_below))
        return false;
    
    var sign_input_y = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    
    if (instance_exists(ladder_below) && !place_meeting(x, y + 1, obj_solid) && sign_input_y == 1 && grounded)
    {
        y++;
        ladder_id = ladder_below;
        x = (ladder_id.x - ladder_id.sprite_xoffset) + (ladder_id.sprite_width / 2);
        
        smc_set_state(state_player_ladder);
        sprite_index = spr_ladder_down;
        
        return true;
    }
    
    if (instance_exists(ladder) && sign_input_y == -1)
    {
        ladder_id = ladder;
        x = (ladder_id.x - ladder_id.sprite_xoffset) + (ladder_id.sprite_width / 2);
        
        smc_set_state(state_player_ladder);
        sprite_index = spr_ladder_up;
        
        return true;
    }
    
    return false;
}

function player_do_wallsplat(forced = false)
{
    if (!PlayerHitWall() && !forced)
        return false;
    
    smc_set_state(state_player_animation);
    sound_instance_one_shot(sfx_player_wall_splat, x, y);
    sprite_set(spr_wallsplat, 0);
            
    vsp = 0;
    grav = 0;
    
    return true;
}

function player_do_ceilingsplat(forced = false)
{
    if (!PlayerHitCeiling() && !forced)
        return false;
        
    smc_set_state(state_player_animation);
    sound_instance_one_shot(sfx_player_groundpound_land, x, y);
    sprite_set(spr_sjump_hit_ceiling, 0);
            
    vsp = 0;
    grav = 0;
    
    return true
}

function player_do_jump(forced = false, sprite_to_set = spr_jump, jump_height = -11, particle = true)
{
    if (!PlayerJump() && !forced)
        return false;
    
    coyote_jump();
    sprite_set(sprite_to_set, 0);
    
    if (particle)
        instance_create(x, y + 45, obj_jump_particle);
    
    sound_instance_one_shot(sfx_jump, x, y);
    
    vsp = jump_height;
    
    return true;
}

function player_do_longjump(forced = false, jump_height = -11)
{
    if (!PlayerJump() && !forced)
        return false;
    
    coyote_jump();
    smc_set_state(state_player_mach);
    sprite_set(spr_longjump_intro, 0);
    instance_create(x, y + 45, obj_jump_particle);
    
    sound_instance_start(snd_roll_getup);
    
    movespeed = max(movespeed, 10);
    vsp = jump_height;
    
    return true;
}

function player_do_jumpstop(forced = false, divisor = 20)
{
    if ((!InputReleased(INPUT_VERB.JUMP) || vsp >= 0 || grounded) && !forced)
        return false;
    
    vsp /= divisor;
    
    return true;
}