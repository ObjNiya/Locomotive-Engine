/*
    Whether or not instance layers should automatically get the configurations of the assigned parallax layer applied at the cost of performance.
    When enabled, a room sized surface will be made to automatically parallax and apply other effects to instance layers.
    When disabled, you will have to manually add 'DrawSelfPrlx' to all of the objects you wish to have parallax effects.
*/
#macro AUTO_MANAGE_INSTANCE_LAYERS true


/**
 * Sets the default depth fog color.
 * @parameter {Constant.Color} color The color to set.
 */
function PrlxCfgDepthFogSetCol(color)
{
    struct_set(global.prlxData.cfg[PRLX_CFG_TYPES.GLOBAL], "depthFogCol", color);
}


/**
 * Sets the default depth fog color using the given red, green and blue channels. 
 * @parameter {Real} red The red component of the fog colour. (From 0 to 255) 
 * @parameter {Real} green The green component of the fog colour. (From 0 to 255) 
 * @parameter {Real} blue The blue component of the fog colour. (From 0 to 255)
 * @parameter {Constant.Color} color The color to set.
 */
function PrlxCfgDepthFogSetColRgb(red, green, blue)
{
   PrlxCfgDepthFogSetCol(make_color_rgb(red, green, blue));
}


/**
 * Sets the default depth fog color using the given hue, saturation and value channels.
 * @parameter {Real} hue The hue of the fog colour (From 0 to 255)
 * @parameter {Real} saturation How saturated the fog colour is (From 0 to 255)
 * @parameter {Real} value How dark the fog colour is (From 0 to 255)
 */
function PrlxCfgDepthFogSetColHsv(hue, saturation, value)
{
    PrlxCfgDepthFogSetCol(make_color_hsv(hue, saturation, value));
}


/**
 * Returns the default depth fog color. If none is set, it will return `c_white` instead.
 * @returns {Constant.Color}
 * @pure
 */
function PrlxCfgDepthFogGetCol()
{
    if (!struct_exists(global.prlxData.cfg[PRLX_CFG_TYPES.GLOBAL], "depthFogCol"))
        return c_white;
        
    return struct_get(global.prlxData.cfg[PRLX_CFG_TYPES.GLOBAL], "depthFogCol");
}


/**
 * Lets you commit a Parallax Layer to the given layer.
 * @parameter {String} layer_name The name of the layer to assign the Parallax layer to.
 * @parameter {Struct} prlx_layer_or_group Which Parallax Layer to assign.
 */
function PrlxCfgCommit(layer_name, prlx_layer)
{
    struct_set(global.prlxData.cfg[PRLX_CFG_TYPES.LAYER], layer_name, prlx_layer);
}


/**
 * Deletes a Parallax Layer from the given layer.
 * @param {String} layer_name The layer to remove Parallax from.
 */
function PrlxCfgDelete(layer_name)
{
    struct_remove(global.prlxData.cfg[PRLX_CFG_TYPES.LAYER], layer_name);
}


/**
 * Clears all Parallax Configurations.
 */
function PrlxCfgClear()
{
    struct_remove(global.prlxData, "cfg");
    struct_set(global.prlxData, "cfg", array_create(2, {}));
}