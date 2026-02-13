/**
 * This function will return whether or not the given value is equal to any of the other provided values.
 * @parameter {Any} value The value to check if it equals to anything.
 * @parameter {Array<Any>} values The values to go trough.
 * @pure
 * @returns {Bool}
 */
function equals_to_any(value, values)
{
    return (array_get_index(values, value) != -1);
}
