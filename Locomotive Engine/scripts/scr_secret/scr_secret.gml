/**
 * Returns whether or not the current room is a secret.
 * @pure
 */
function IsSecret()
{
    return instance_exists(obj_secret_marker);
}