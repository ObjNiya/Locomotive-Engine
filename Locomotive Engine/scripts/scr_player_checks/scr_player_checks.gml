function player_check_nothing_above()
{
    return (!place_meeting(x, y - 32, obj_solid));
}

function player_check_hit_wall()
{
    return (place_meeting(x + dir, y, obj_solid))
}

function player_check_hit_ceiling()
{
    return (place_meeting(x, y - 1, obj_solid));
}

function player_check_can_get_up()
{
    return (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != 1 && player_check_nothing_above() && grounded);
}

function player_check_can_jump()
{
    return (can_jump && InputPressed(INPUT_VERB.JUMP) && !place_meeting(x, y - 1, obj_solid));
}

function player_check_can_crouch()
{
    return (grounded && sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
}

function player_check_can_dive()
{
    return (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1);
}

function player_check_can_taunt()
{
    return (InputPressed(INPUT_VERB.TAUNT));
}

function player_check_can_wallclimb()
{
    return (player_check_hit_wall() && (!grounded || (grounded && groundedSlope)));
}

function player_check_can_machrun()
{
    return (!player_check_hit_wall() && InputCheck(INPUT_VERB.MACHRUN) && grounded);
}

function player_check_can_machturn()
{
    return (sign(InputX(INPUT_CLUSTER.NAVIGATION) == -dir && movespeed > 8 && grounded));
}

function player_check_can_machinstaturn()
{
    return (sign(InputX(INPUT_CLUSTER.NAVIGATION) == -dir && movespeed <= 8 && grounded));
}

function player_check_can_machslide()
{
    return (!InputCheck(INPUT_VERB.MACHRUN) && movespeed > 8 && grounded);
}

function player_check_can_groundpound()
{
    return (InputPressed(INPUT_VERB.DOWN) && !grounded);
}

function player_check_can_machstop()
{
    return (!InputCheck(INPUT_VERB.MACHRUN) && movespeed <= 8 && grounded);
}

function player_check_can_grabdash()
{
    return (InputPressed(INPUT_VERB.GRABDASH) && (grabdash_bump_buffer <= 0 || sprite_index != spr_grabdash_bump));
}

function player_check_can_divebomb()
{
    return (InputPressed(INPUT_VERB.JUMP) && !grounded);
}

function player_check_can_sjump_prepare()
{
    return (InputPressed(INPUT_VERB.UP) && grounded);
}

function player_check_sjump_prepare_release()
{
    return (!InputCheck(INPUT_VERB.UP) && grounded)
}
function player_try_jumpstop(divisor = 20)
{
    if (!InputReleased(INPUT_VERB.JUMP) || vsp >= 0 || grounded)
        return false;
    
    vsp /= divisor;
    
    return true;
}