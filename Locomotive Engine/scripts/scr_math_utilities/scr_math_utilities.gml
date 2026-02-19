/**
 * This function will move ```a``` to ```b``` by the given amount.
 * @parameter {Real} a The value to move from.
 * @parameter {Real} b The value to move to.
 * @parameter {Real} amt By how much to move to the goal value.
 * @pure
 * @returns {Real}
*/
function approach(a, b, amt)
{
    return a + clamp(b - a, -amt, amt);
}

/**
 * This function will return the sign of the given number. Howevever, if said sign equates to 0, the return value will fall back to the given fall back value.
 * @parameter {Real} n The number to get the sign of.
 * @parameter {Real} fallback The number to fall back to if the sign of n equates to 0.
 * @pure
 * @returns {Real}
*/
function side(n, fallback)
{
    return (sign(n) == 0) ? fallback : n;
}

/**
 * This function will return the sign of the given boolean, returning -1 if it's false and 1 if it's true.
 * @parameter {Bool} b The boolean to get the sign of.
 * @pure
 * @returns {Real}
 */
function bsign(b)
{
    return (!b) ? -1 : 1;
}

function get_lerp_number(_start,_end,_pct)
{
	//i cant remember if i may be absoloutely fucking stupid for this but idk
	return (_end - _start) * _pct
}
    