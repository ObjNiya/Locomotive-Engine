/**
 * Returns a random number in range of -n and n.
 * @parameter {Real} n How high and low the randomized number can go.
 * @pure
 */
function RandomSign(n)
{
    return random_range(-n, n);
}

/**
 * Returns a random integer number in range of -n and n.
 * @parameter {Real} n How high and low the randomized integer number can go.
 * @pure
 */
function IRandomSign(n)
{
    return irandom_range(-n, n);
}