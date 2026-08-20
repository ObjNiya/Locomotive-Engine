// Feather ignore all

enum PRLX_LAYER
{
    AUTO_CREATE_ENABLE = 0,
    AUTO_CREATE_DEPTH = 1,
    AUTO_CREATE_FUNC = 2,
    
    NO_SURF = 3,
    CAM_SIZED_SURF = 4,
    ROOM_SIZED_SURF = 5,
    
    VAL_MOD_SCROLLER = 0,
    VAL_MOD_PRLX_AXIS = 1,
    VAL_MOD_PRLX_MULT = 2,
    VAL_MOD_VAL_NAME = 3,
    VAL_MOD_ARR_VAL_INDEX = 4,
    VAL_MOD_IS_FX_PARAM = 5,
}


/// @ignore
function __Scroller__(spd) constructor
{
    pos = 0;

    static SetSpeed = function(spd)
    {
        if (is_method(spd) || is_real(spd) || is_struct(spd))
            self.spd = spd;
        else
            self.spd = animcurve_get(spd);
    }
    
    static SetRange = function(minimum, maximum, wrap = false) /*=>*/
    {
        minPos = minimum;
        maxPos = maximum;
        wrapPos = wrap;
    }
    
    /// @ignore
    static Step = function()
    {
        if (is_method(spd))
            pos += spd((pos - minPos) / maxPos);
        else if (is_struct(spd))
        {
            var channel = animcurve_get_channel(spd, 0);
            pos += animcurve_channel_evaluate(channel, (pos - minPos) / maxPos);
        }
        else if (is_real(spd))
            pos += spd;
        else
            throw "The speed value(s) is not an animation curve, animation curve struct, function or real number and is therefore invalid!";
            
        if (pos > maxPos && wrapPos)
            pos = minPos;
        else if (pos < minPos && wrapPos)
            pos = maxPos;
        
        pos = clamp(pos, minPos, maxPos);
    }
    
    SetSpeed(spd);
    SetRange(-9007199254740991, 9007199254740991, true);
}

/// @ignore
function __LayerelementData__(element) constructor
{
    elementID = element;
    xScale = undefined;
    yScale = undefined;
    angle = undefined;
    blend = undefined;
    alpha = undefined;
    
    switch (layer_get_element_type(elementID))
    {
        case layerelementtype_background:
            xScale = layer_background_get_xscale(elementID);
            yScale = layer_background_get_yscale(elementID);
            blend = layer_background_get_blend(elementID);
            alpha = layer_background_get_alpha(elementID);
            break;
            
        case layerelementtype_sequence:
            xScale = layer_sequence_get_xscale(elementID);
            yScale = layer_sequence_get_yscale(elementID);
            angle = layer_sequence_get_angle(elementID);
            break;
            
        case layerelementtype_sprite:
            xScale = layer_sprite_get_xscale(elementID);
            yScale = layer_sprite_get_yscale(elementID);
            angle = layer_sprite_get_angle(elementID);
            blend = layer_sprite_get_blend(elementID);
            alpha = layer_sprite_get_alpha(elementID);
            break;
            
        case layerelementtype_text:
            xScale = layer_text_get_xscale(elementID);
            yScale = layer_text_get_yscale(elementID);
            angle = layer_text_get_angle(elementID);
            blend = layer_text_get_blend(elementID);
            alpha = layer_text_get_alpha(elementID);
            break;
    }
}

/// @ignore
function __PrlxLog__(txt)
{
    show_debug_message("Parallaxer - " + txt);
}