function create_flash_effect(has_vh = false)
{
    with (create_effect(x, y, obj_flash_effect))
    {
        self.has_vh = has_vh;
        
        return id;
    }
}