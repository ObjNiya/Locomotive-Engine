/**
 * Returns number ```a``` moved to number ```b``` by the given amount.
 * @parameter {Real} a The value to move from.
 * @parameter {Real} b The value to move to.
 * @parameter {Real} amt By how much to move to the goal value.
 * @pure
 * @returns {Real}
*/
function Approach(a, b, amt)
{
    return a + clamp(b - a, -amt, amt);
}

/**
 * Returns the sign of the given number if it's not 0. If it is, it returns the given fallback number instead.
 * @parameter {Real} n The number to get the sign of.
 * @parameter {Real} fallback The number to fall back to if the sign of n is equal to 0.
 * @pure
 * @returns {Real}
*/
function Side(n, fallback)
{
    n = sign(n);
    return (n == 0) ? fallback : n;
}

/**
 * Returns the sign of the given bool, returning -1 if the bool is false and 1 vice-versa.
 * @parameter {Bool} b The boolean to get the sign of.
 * @pure
 * @returns {Real}
 */
function BSign(b)
{
    return (!b) ? -1 : 1;
}


/// @description Returns the absolute floor of val, that is, val floored down to its least magnitude in either direction.
/// @param {real} val The value to absolute floor.	
/// @return {real}
function abs_floor(val) {
	return (val > 0 ? floor(val) : ceil(val));
}

// TODO: BASE GAME FUNCTION

function distance_to_pos(arg0, arg1, arg2, arg3, arg4, arg5)
{
    return abs(arg0 - arg2) <= arg4 && abs(arg1 - arg3) <= arg5;
}

function map(value, in_min, in_max, out_min, out_max)
{
	return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}


/**
 * Returns whether or not the given number is in the given range.
 * @parameter {Real} n The number to check for.
 * @parameter {Real} a The minimum of the range.
 * @parameter {Real} b The maximum of the range.
 */
function InRange(n, a, b)
{
    return n >= a && n <= b;
}
