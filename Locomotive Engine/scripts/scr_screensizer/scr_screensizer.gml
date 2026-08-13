/**
 * Returns the aspect ratio of the given resolution's width and height as a decimal.
 * @parameter {Real} width The width of the resolution to get the aspect ratio of.
 * @parameter {Real} height The height of the resolution to get the aspect ratio of.
 * @pure
 */
function GetResAspectRatio(width, height)
{
    return width / height;
}


/**
 * Returns the current aspect ratio of your application in the given format.
 * @parameter {String} format Either String, Number or Array. (```string = "16:9"```, ```number = 1.77```, ```array = [16, 9]```)
 * @pure
 */
function AppGetAspectRatio(format)
{
    format = string_lower(format);
    
    switch (format)
    {
        case "string":
            return string_concat(global.aspectRatio[0], ":", global.aspectRatio[1]);
            
        case "number":
            return global.aspectRatio[0] / global.aspectRatio[1];   
        
        case "array":        
            return global.aspectRatio;    
    }
}


/**
 * Sets the aspect ratio of your application to the given String, Number or Array.
 * @parameter {String|Array<Real>|Real} aspect_ratio The aspect ratio to set. (Possible formats: "16:9", 1.77, [16, 9])
 */
function AppSetAspectRatio(aspect_ratio)
{
    switch (typeof(aspect_ratio))
    {
        case "string":
            aspect_ratio = string_split(aspect_ratio, ":");
            if (array_length(aspect_ratio) < 2)
                return false;
            
            var i = 0;
            repeat (2)
            {
                aspect_ratio[i] = string_digits(aspect_ratio[i]);
                if (aspect_ratio[i] == "")
                    return false;
                
                aspect_ratio[i] = real(aspect_ratio[i]);
                i++;
            }
            
            return AppSetAspectRatio(aspect_ratio);
        
        case "number":
            var old_aspect_ratio = global.aspectRatio[0] / global.aspectRatio[1];
            
            if (old_aspect_ratio == aspect_ratio)
                return false;
            
            if (aspect_ratio % 1 == 0)
            {
                AppSetAspectRatio([aspect_ratio, 1]);
                return true;
            }
            
            var width = display_get_width();
            var height = display_get_height();
            
            var decimal_places = string(aspect_ratio);
            decimal_places = string_split(decimal_places, ".")[1];
            decimal_places = string_length(decimal_places);
            
            var denominator = power(10, decimal_places);
            var numerator = round(aspect_ratio * denominator);
            
            var divisor = abs(__Gcd__(width, height));
            return AppSetAspectRatio([width / divisor, height / divisor]);
        
        case "array":
            if (array_length(aspect_ratio) < 2 || !is_real(aspect_ratio[0]) || !is_real(aspect_ratio[1]))
                return false;
            if (aspect_ratio[0] == global.aspectRatio[0] && aspect_ratio[1] == global.aspectRatio[1])
                return false;
            
            global.aspectRatio = aspect_ratio;
            global.baseAppWidth = global.baseAppHeight * AppGetAspectRatio("number");
            __ResizeScreen__();
            
            return true;
    }
}


/**
 * Flips the current aspect ratio of your application, meant for rotatable screens like mobile phone screens. 
 */
function AppFlipAspectRatio()
{
    AppSetAspectRatio(array_reverse(global.aspectRatio));
}


/**
 * Toggles Pixel Perfect based on the given boolean.
 * @parameter {Bool} enabled Whether or not to enable Pixel Perfect.
 */
function AppSetPixelPerfect(enabled)
{
    if (global.pixelPerfect == enabled)
        return false;
    
    global.pixelPerfect = enabled;
    __ResizeScreen__();
    
    return true;
}


/**
 * Sets Resizing Mode based on the given RESIZING_MODES enum member.
 * @parameter {Real} resizing_mode Which RESIZING_MODES enum member to set Resizing Mode to.
 */
function AppSetResizingMode(resizing_mode)
{
    if (global.resizingMode == resizing_mode)
        return false;
    
    global.resizingMode = resizing_mode;
    __ResizeScreen__();
    
    return true;
}


/**
 * Creates and returns a sprite of your application (excluding the GUI) to be used when your application is paused.
 * @pure
 */
function AppGetPauseSpr(smooth)
{ 
    var w = surface_get_width(application_surface);
    var h = surface_get_height(application_surface);
        
    return sprite_create_from_surface(application_surface, 0, 0, w, h, false, smooth, 0, 0);
}


/**
 * With this function you can assign a function to your application and it will be called before your application is rendered. (Excluding the GUI)
 * @parameter {Function} name The function to assign to your application, or -1 to not assign any.
 */
function AppScriptBegin(script)
{
    obj_screensizer.appScriptBegin = script;
}


/**
 * With this function you can assign a function to your application and it will be called after your application is rendered. (Excluding the GUI)
 * @parameter {Function} name The function to assign to your application, or -1 to not assign any.
 */
function AppScriptEnd(script)
{
    obj_screensizer.appScriptEnd = script;
}