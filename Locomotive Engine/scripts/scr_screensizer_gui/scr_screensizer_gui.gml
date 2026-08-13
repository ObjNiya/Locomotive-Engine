/**
 * Returns the GUI Scale option and clamps it to its limits.
 * @pure
 */
function GuiGetScale()
{
    return clamp(global.guiScale, MIN_GUI_SCALE, global.guiMaxScale);
}


/**
 * Recalculates the given position into a GUI position to account for GUI Scaling and returns it.
 * @pure
 */
function GuiCalcPos(pos)
{
    return pos * GuiGetScale();
}


/**
 * Calculates a GUI position for the x axis to account for GUI Scaling and resizing based on the given alignment and offset.
 * @parameter {Constant.HAlign} align What point to align the GUI position to.
 * @pure
 */
function GuiCalcX(align)
{
    if (align == fa_left)
        return 0;
    
    var gui_x = display_get_gui_width() / GuiGetScale();
    if (align == fa_center)
        gui_x /= 2;
    return gui_x;
}


/**
 * Calculates a GUI position for the y axis to account for GUI Scaling and resizing based on the given alignment and offset.
 * @parameter {Constant.VAlign} align What point to align the GUI position to.
 * @pure
 */
function GuiCalcY(align)
{
    if (align == fa_top)
        return 0;
    
    var gui_y = display_get_gui_height() / GuiGetScale();
    if (align == fa_middle)
        gui_y /= 2;
    return gui_y;
}


/**
 * Creates and returns a sprite of the GUI to be used when your application is paused.
 * @pure
 */
function GuiGetPauseSpr(smooth)
{
    if (!surface_exists(obj_screensizer.guiSurf))
        return -1;
    
    var gui_scale = GuiGetScale();
    var w = display_get_gui_width() / gui_scale;
    var h = display_get_gui_height() / gui_scale;
    
    return sprite_create_from_surface(obj_screensizer.guiSurf, 0, 0, w, h, false, smooth, 0, 0);
}


/**
 * With this function you can assign a function to the GUI and it will be called before the GUI is rendered.
 * @parameter {Function} name The function to assign to the GUI, or -1 to not assign any.
 */
function GuiScriptBegin(script)
{
    obj_screensizer.guiScriptBegin = script;
}


/**
 * With this function you can assign a function to the GUI and it will be called after the GUI is rendered.
 * @parameter {Function} name The function to assign to the GUI, or -1 to not assign any.
 */
function GuiScriptEnd(script)
{
    obj_screensizer.guiScriptEnd = script;
}