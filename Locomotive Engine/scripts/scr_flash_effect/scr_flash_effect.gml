/**
 * This function will create a flash effect that follows the current instance.
 * @parameter {Bool} has_vh Whether or not the instance to follow has sprite drawing variables initialized by ```visual_helper_initialize```, so the flash effect can account for them.
 * @returns {Id.Instance}
 */
function create_flash_effect(has_vh = false)
{
    with (create_effect(x, y, obj_flash_effect))
    {
        self.has_vh = has_vh;
        
        return id;
    }
}