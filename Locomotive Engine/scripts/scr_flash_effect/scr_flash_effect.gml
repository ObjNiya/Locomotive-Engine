/**
 * Creates variables neccessary for the Flash Effect to be applied on the current instance.
 */
function FlashEffectInit()
{
    flashTime = 0;
}


/**
 * Sets the Flash Time for the flash effect on the current instance.
 * @parameter {Real} duration (OPTIONAL) The duration of the flash effect in frames.
 */
function FlashEffectSet(duration = 8)
{
    flashTime = duration;
}


/**
 * Enables the Flash Effect drawing if the current instances' Flash Time hasn't expired and counts down the Flash Time.
 */
function FlashEffectDraw()
{
    if (--flashTime <= 0)
        return false;
    
    ColorMixSet(COLOR_MIX_MODES.MIX, 1, c_white, true);
    return true;
}


/**
 * Disables the Flash Effect drawing if it was enabled beforehand.
 */
function FlashEffectDrawReset()
{
    if (shader_current() == shd_color_mix)
        shader_reset();
}