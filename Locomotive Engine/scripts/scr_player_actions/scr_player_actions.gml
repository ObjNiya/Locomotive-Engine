function player_do_cape(forced = false)
{
    if (!PLAYER_CAPE && !forced)
        return false;
    
    sound_instance_one_shot(sfx_damian_cape_start, x, y);
    create_flash_effect(true);
    
    smc_set_state(state_player_cape);
    return true;
}

function player_do_grabdash(forced = false)
{
    if (!PLAYER_GRABDASH && !forced)
        return false;
    
    create_particle(x, y + 45, obj_burst_cloud_particle);
    smc_set_state(state_player_grabdash);
    return true;
}

function player_do_groundpound(forced = false, divebomb = false)
{
    if (((!PLAYER_GROUNDPOUND && !divebomb) || (!PLAYER_DIVEBOMB && divebomb)) && !forced)
        return false;
    
    smc_set_state(state_player_groundpound);
    
    if (divebomb)
        sprite_set(spr_divebomb, 0);
    
    return true;
}

function player_do_machslide(forced = false)
{
    if (!PLAYER_MACHSLIDE && !forced)
        return false;
    
    sound_instance_one_shot(sfx_mach_brake, x, y);
    smc_set_state(state_player_machslide);
    
    return true;
}

function player_do_machturn(forced = false)
{
    if (!PLAYER_MACHTURN && !forced)
        return false;
    
    sound_instance_one_shot(sfx_mach_turn, x, y);
    smc_set_state(state_player_machturn);
    
    return true;
}

function player_do_uppercut(forced = false)
{
    if (!PLAYER_UPPERCUT && !forced)
        return false;
    
    sound_instance_one_shot(sfx_player_uppercut, x, y);
    instance_create(x, y + 45, obj_jump_particle);
    
    smc_set_state(state_player_uppercut);
    return true;
}

function player_do_ladder()
{
    if (grounded && place_meeting(x, y + 1, obj_ladder) && !place_meeting(x, y + 1, obj_solid) && sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
    {
        y++;
        ladder_id = instance_place(x, y + 1, obj_ladder);
        
        smc_set_state(state_player_ladder);
        sprite_index = spr_ladder_down;
        return true;
    }
    
    if (place_meeting(x, y, obj_ladder) && sign(InputY(INPUT_CLUSTER.NAVIGATION)) == -1)
    {
        ladder_id = instance_place(x, y, obj_ladder);
        
        smc_set_state(state_player_ladder);
        return true;
    }
    
    return false;
}

function player_do_wallsplat(forced = false)
{
    if (!PLAYER_HIT_WALL && !forced)
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
    if (!PLAYER_HIT_CEILING && !forced)
        return false;
        
    smc_set_state(state_player_animation);
    sound_instance_one_shot(sfx_player_groundpound_land, x, y);
    sprite_set(spr_sjump_hit_ceiling, 0);
            
    vsp = 0;
    grav = 0;
    
    return true;
}

function player_do_jump(forced = false, sprite_to_set = spr_jump, jump_height = -11)
{
    if (!PLAYER_JUMP && !forced)
        return false;
    
    coyote_jump();
    sprite_set(sprite_to_set, 0);
    instance_create(x, y + 45, obj_jump_particle);
    
    sound_instance_one_shot(sfx_jump, x, y);
    
    vsp = jump_height;
    
    return true;
}

function player_do_longjump(forced = false, jump_height = -11)
{
    if (!PLAYER_JUMP && !forced)
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