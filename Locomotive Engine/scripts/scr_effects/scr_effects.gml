function EffectCreate(x, y, effect_obj, effect_spr = -1, palette_spr = -1, palette_index = 0, on_gui = false)
{
    with (InstanceCreate(x, y, effect_obj))
    {
        spawnedBy = other.id;
        onGui = on_gui;
        paletteSpr = palette_spr;
        paletteIndex = palette_index;
        
        if (effect_spr != -1)
        {
            sprite_index = effect_spr;
            SetLayer(sprite_index);
        }
        
        return id;
    }
}