/**
 * Apply Escape BGs
 */

if (!IsShowtime())
    exit;

var layers = layer_get_all();

var fg_bricks_lay = layer_create(layer_get_depth(layers[0]) - 1, "Foregrounds_Bricks");
layer_vspeed(fg_bricks_lay, 4);

var fg_bricks = layer_background_create(fg_bricks_lay, fg_falling_bricks);
layer_background_htiled(fg_bricks, true);
layer_background_vtiled(fg_bricks, true);
// TODO: Escape BGS dont rlly work

var LayerI = function(lay, index)
{
    var l_name = layer_get_name(lay);
    l_name = string_lower(l_name);
    
    if (string_pos("backgrounds", l_name) == 0 && string_pos("foregrounds", l_name) == 0)
        return;
    
    if (string_pos("backgrounds_1", l_name) != 0)
    {
        var bg_bricks_lay = layer_create(layer_get_depth(lay) - 1, "Backgrounds_Bricks");
        layer_vspeed(bg_bricks_lay, 2);
        
        var fg_bricks = layer_background_create(bg_bricks_lay, bg_falling_bricks);
        layer_background_htiled(fg_bricks, true);
        layer_background_vtiled(fg_bricks, true);
    }
    
    var lay_elem = layer_background_get_id(lay);
    var lay_spr = layer_background_get_sprite(lay_elem);
    
    var lay_spr_name = sprite_get_name(lay_spr);
    var lay_spr_escape = AssetGetIndexFast(lay_spr_name + "_escape", asset_sprite);
    QuickLog(lay_spr_escape)
    
    if (lay_spr_escape != -1)
        layer_background_change(lay_elem, lay_spr_escape);
}

array_foreach(layers, LayerI);

