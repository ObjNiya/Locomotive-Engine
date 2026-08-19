/**
 * Returns whether or not the current player instance hit a solid wall horizontally.
 */
function PlayerHitWall()
{
    return place_meeting_collision(x + sign(image_xscale), y, Exclude.SLOPES);
}


/**
 * Returns whether or not the current player instance hit a solid from the top.
 */
function PlayerHitCeiling()
{
    return place_meeting_collision(x, y - 1);
}


/**
 * Returns whether or not the current player instance is on the ground and is holding down, permitting them to crouch.
 */
function PlayerCrouch()
{
    return grounded && sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1;
}


/**
 * Returns whether or not there is a solid block a tile above the current player instance.
 */
function PlayerNothingAbove()
{
    return !place_meeting_collision(x, y - 32);
}


/**
 * Returns whether or not there is a solid block a tile above the current player instance, if they are holding up and are on the ground, permitting them to uncrouch.
 */
function PlayerGetUp()
{
    return sign(InputY(INPUT_CLUSTER.NAVIGATION)) != 1 && PlayerNothingAbove() && grounded;
}


/**
 * Returns whether or not the current player instance is on the ground, is pressing jump and there's no solid block right above them, permitting them to jump.
 */
function PlayerJump()
{
    return canJump && InputPressed(INPUT_VERB.JUMP) && !place_meeting_collision(x, y - 1);
}


/**
 * Returns whether or not the current player instance is pressing grabdash and hasn't bumped from grabdashing, permitting them to grabdash.
 */
function PlayerGrabdash()
{
    return InputPressed(INPUT_VERB.GRABDASH) && sprite_index != spr_grabdash_bump;
}


/**
 * Returns whether or not the current player instance is able to grabdash and they're holding up, permitting them to uppercut.
 */
function PlayerUppercut()
{
    return PlayerGrabdash() && sign(InputY(INPUT_CLUSTER.NAVIGATION)) == -1;
}


/**
 * Returns whether or not the current player instance isn't on the ground and is pressing groundpound, permitting them to groundpound.
 * If groundpound isn't bound to anything, it will check if down is held instead.
 */
function PlayerGroundpound()
{
    var gamepad = InputPlayerUsingGamepad();
    var grndpnd_bind = InputBindingGet(gamepad, INPUT_VERB.GROUNDPOUND);
    
    var input_chk = (ArrayIsEmpty(grndpnd_bind)) ? InputCheck(INPUT_VERB.DOWN) : InputPressed(INPUT_VERB.GROUNDPOUND);
    return input_chk && !grounded;
}


/**
 * Returns whether or not the current player instance isn't hitting a wall, is grounded and is pressing mach run, permitting them to mach run.
 */
function PlayerMachrun()
{
    return !PlayerHitWall() && InputCheck(INPUT_VERB.MACHRUN) && grounded;
}


/**
 * Returns whether or not the current player instance is pressing the opposite of their current direction, their movespeed is equal to or below 8 and are grounded, permitting them to instantly machturn.
 */
function PlayerMachinstaturn()
{
    return sign(InputX(INPUT_CLUSTER.NAVIGATION)) == -dir && movespeed <= 8 && grounded;
}


/**
 * Returns whether or not the current player instance is pressing the opposite of their current direction, their movespeed is higher than 8 and are grounded, permitting them to machturn.
 */
function PlayerMachturn()
{
    return sign(InputX(INPUT_CLUSTER.NAVIGATION)) == -dir && movespeed > 8 && grounded;
}


/**
 * Returns whether or not the current player instance let go of mach run, their movespeed is equal to or below 8 and are grounded, permitting them to instantly stop mach running.
 */
function PlayerMachstop()
{
    return !InputCheck(INPUT_VERB.MACHRUN) && movespeed <= 8 && grounded;
}


/**
 * Returns whether or not the current player instance let go of mach run, their movespeed is higher than 8 and are grounded, permitting them to mach slide.
 */
function PlayerMachslide()
{
    return !InputCheck(INPUT_VERB.MACHRUN) && movespeed > 8 && grounded;
}


/**
 * Returns whether or not the current player instance hit a wall, isn't on the ground or is on a slope, permitting them to wallclimb.
 */
function PlayerWallclimb()
{
    return PlayerHitWall() && (!grounded || (grounded && groundedSlope));
}


/**
 * Returns whether or not the current player instance is holding down and isn't on the ground, permitting them to dive.
 */
function PlayerDive()
{
    return sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1 && !grounded;
}


/**
 * Returns whether or not the current player instance is pressing jump and isn't on the ground, permitting them to divebomb.
 */
function PlayerDivebomb()
{
    return InputPressed(INPUT_VERB.JUMP) && !grounded;
}


/**
 * Returns whether or not the current player instance is grounded, at mach 3 or higher and is pressing superjump, permitting them to superjump.
 * If superjump isn't bound to anything, it will check if up is held instead.
 */
function PlayerSjump()
{
    var gamepad = InputPlayerUsingGamepad();
    var grndpnd_bind = InputBindingGet(gamepad, INPUT_VERB.SUPERJUMP);
    
    var input_chk = (ArrayIsEmpty(grndpnd_bind)) ? InputCheck(INPUT_VERB.UP) : InputPressed(INPUT_VERB.SUPERJUMP);
    return InputPressed(INPUT_VERB.SUPERJUMP) && grounded && PlayerGetMachStage() >= 3;
}


/**
 * Returns whether or not the current player instance isn't grounded, at mach 3 or higher and is pressing superjump, permitting them to fly with their cape.
 * If superjump isn't bound to anything, it will check if up is held instead.
 */
function PlayerCape()
{
    grounded = !grounded;
    var result = PlayerSjump();
    grounded = !grounded;
    
    return result;
}


/**
 * Returns whether or not the current player instance is grounded and isn't holding the superjump bind, permitting them to release their superjump.
 * If superjump isn't bound to anything, it will check if up isn't held instead.
 */
function PlayerSjumpRelease()
{
    var gamepad = InputPlayerUsingGamepad();
    var grndpnd_bind = InputBindingGet(gamepad, INPUT_VERB.SUPERJUMP);
    
    var input_chk = (ArrayIsEmpty(grndpnd_bind)) ? !InputCheck(INPUT_VERB.UP) : !InputCheck(INPUT_VERB.SUPERJUMP);
    
    return input_chk && grounded;
}