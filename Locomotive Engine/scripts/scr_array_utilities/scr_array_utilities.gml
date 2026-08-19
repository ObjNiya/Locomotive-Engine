/**
 * Adds every numeric entry in the given array together and returns the result.
 * @parameter {Array<Real>} array The array to get the sum of.
 * @pure
 */
function ArrayGetSum(array)
{
    var total = 0;
    var i = 0;
    var array_len = array_length(array);
    
    repeat (array_len)
    {
        var val = array[i];
        
        if (is_numeric(val))
            total += real(val);
        
        i++;
    }
    
    return total;
}


/**
 * Returns whether or not the given index is within the given arrays bounds.
 * @parameter {Array} array The array to check.
 * @parameter {Real} index The index to check.
 * @pure
 */
function ArrayInBounds(array, index)
{
    return (index >= 0 || index < array_length(array) - 1);
}


/**
 * Returns a random entry from the given array.
 * @parameter {Array} array The array to get the random value from.
 * @pure
 */
function ArrayGetRandom(array)
{
    return array[irandom(array_length(array) - 1)];
}

/**
 * Returns whether or not the given array is empty.
 * @parameter {Array} array The array to check.
 * @pure
 */
function ArrayIsEmpty(array)
{
    return array_length(array) <= 0;
}