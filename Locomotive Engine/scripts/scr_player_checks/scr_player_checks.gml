function PlayerHitWall()
{
    return place_meeting_collision(x + sign(image_xscale), y, Exclude.SLOPES);
}

function PlayerHitCeiling()
{
    return place_meeting_collision(x, y - 1);
}

function PlayerCrouch()
{
    return grounded && sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1;
}

function PlayerNothingAbove()
{
    return !place_meeting_collision(x, y - 32);
}

function PlayerGetUp()
{
    return sign(InputY(INPUT_CLUSTER.NAVIGATION)) != 1 && PlayerNothingAbove() && grounded;
}

function PlayerJump()
{
    return can_jump && InputPressed(INPUT_VERB.JUMP) && !place_meeting_collision(x, y - 1);
}

function PlayerGrabdash()
{
    return InputPressed(INPUT_VERB.GRABDASH) && sprite_index != spr_grabdash_bump;
}

function PlayerUppercut()
{
    return PlayerGrabdash() && sign(InputY(INPUT_CLUSTER.NAVIGATION)) == -1;
}

function PlayerGroundpound()
{
    return InputPressed(INPUT_VERB.GROUNDPOUND) && !grounded;
}

function PlayerMachrun()
{
    return !PlayerHitWall() && InputCheck(INPUT_VERB.MACHRUN) && grounded;
}

function PlayerMachinstaturn()
{
    return sign(InputX(INPUT_CLUSTER.NAVIGATION)) == -dir && movespeed <= 8 && grounded;
}

function PlayerMachturn()
{
    return sign(InputX(INPUT_CLUSTER.NAVIGATION)) == -dir && movespeed > 8 && grounded;
}

function PlayerMachstop()
{
    return !InputCheck(INPUT_VERB.MACHRUN) && movespeed <= 8 && grounded;
}

function PlayerMachslide()
{
    return !InputCheck(INPUT_VERB.MACHRUN) && movespeed > 8 && grounded;
}

function PlayerWallclimb()
{
    return PlayerHitWall() && (!grounded || (grounded && groundedSlope));
}

function PlayerDive()
{
    return sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1 && !grounded;
}

function PlayerDivebomb()
{
    return InputPressed(INPUT_VERB.JUMP) && !grounded;
}

function PlayerCape()
{
    return InputPressed(INPUT_VERB.SUPERJUMP) && !grounded && player_get_mach_stage() >= 3;
}

function PlayerSjump()
{
    return InputPressed(INPUT_VERB.SUPERJUMP) && grounded && player_get_mach_stage() >= 3;
}

function PlayerSjumpRelease()
{
    return !InputCheck(INPUT_VERB.SUPERJUMP) && grounded;
}