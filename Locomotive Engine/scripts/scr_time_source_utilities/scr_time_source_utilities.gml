/**
 * Returns the given time sources' period in miliseconds.
 * @pure
 */
function TimeSourceGetMiliseconds(id)
{
    var time = time_source_get_period(id) * 1000;

    if (time_source_get_units(id) != time_source_units_seconds)
        time /= game_get_speed(gamespeed_fps);
        
    return floor(time);
}


/**
 * Returns the given time sources' period in centiseconds.
 * @pure
 */
function TimeSourceGetCentiseconds(id)
{
    return floor(TimeSourceGetMiliseconds(id) / 10);
}


/**
 * Returns the given time sources' period in decieconds.
 * @pure
 */
function TimeSourceGetDeciseconds(id)
{
    return floor(TimeSourceGetMiliseconds(id) / 100);
}


/**
 * Returns the given time sources' period in seconds.
 * @pure
 */
function TimeSourceGetSeconds(id)
{
    return floor(TimeSourceGetMiliseconds(id) / 1000);
}


/**
 * Returns the given time sources' period in minutes.
 * @pure
 */
function TimeSourceGetMinutes(id)
{
    return floor(TimeSourceGetMiliseconds(id) / 60000);
}


/**
 * Returns the given time sources' period in hours.
 * @pure
 */
function TimeSourceGetHours(id)
{
    return floor(TimeSourceGetMiliseconds(id) / 3600000);
}


/**
 * Returns the given time sources' period in hours, minutes, seconds and subseconds.
 * @parameter {Real} length How many different units should be returned.
 * @parameter {Real} subsecond_precision How small the subsecond unit is. 0 = no subseconds are added to the array.
 * @returns {Array<Real>}
 * @pure
 */
function TimeSourceGetTimeArr(id, length, subsecond_precision)
{
    var smh = [TimeSourceGetHours(id), TimeSourceGetMinutes(id), TimeSourceGetSeconds(id)];
    var start = 2 - length;
    var i = start
    
    repeat (length + 1)
    {
        if (i - 1 > start)
            smh[i] -= 60 * smh[i - 1];
        i++;
    }
    
    if (subsecond_precision <= 0)
        return smh;
    
    subsecond_precision--;
    
    var dcm = [TimeSourceGetDeciseconds(id), TimeSourceGetCentiseconds(id), TimeSourceGetMiliseconds(id)];
    var dcm_mults = [10, 100, 1000];
    var time = dcm[subsecond_precision] - (dcm_mults[subsecond_precision] * GetSeconds());
    
    array_push(smh, time);
    return smh;
}


/// @ignore
function __TimeSourceDrawPrepareTxt__(id, length, short_start, subsecond_precision)
{
    var time_array = TimeSourceGetTimeArr(id, length, subsecond_precision);
    var time_length = array_length(time_array) - 1;
    
    length = clamp(length, 0, time_length);
    
    var start = time_length - length;
    var i = start;
    
    repeat (length + 1)
    {
        var min_length = 2;
        if (short_start && i == start)
            min_length = 1;
        else if (i == 3)
            min_length = subsecond_precision;
        
        time_array[i] = string(time_array[i]);
        
        var padding_0s = "";
        var padding_to_add = min_length - string_length(time_array[i]);
        if (padding_to_add < 0)
            padding_to_add = 0;
        
        repeat (padding_to_add)
            padding_0s += "0";
        
        time_array[i] = padding_0s + time_array[i];
        
        if (i == 2 && time_length >= 3)
            time_array[i] += ".";
        else if (i != 3) 
            time_array[i] += ":";
        i++;
    }
    
    i = start - 1;
    
    repeat (start)
    {
        array_delete(time_array, i, 1);
        i--;
    }
    
    return time_array;
}


/**
 * Draws the period of the given time source as text with the given color and transformations.
 * @parameter {Real} x The x coordinate to draw the period at.
 * @parameter {Real} y The y coordinate to draw the period at.
 * @parameter {Real} xscale The horizontal scale (default 1).
 * @parameter {Real} yscale The vertical scale (default 1).
 * @parameter {Real} angle The angle of the period.
 * @parameter {Constant.Color} c1 The colour for the top left of the period.
 * @parameter {Constant.Color} c2 The colour for the top right of the period.
 * @parameter {Constant.Color} c3 The colour for the bottom right of the period.
 * @parameter {Constant.Color} c4 The colour for the bottom left of the period.
 * @parameter {Real} alpha The alpha of the period.
 * @parameter {Real} subsecond_precision How small the subsecond unit is. 0 = no subseconds are added to the array.
 * @parameter {Real} length How many different units should be returned.
 * @parameter {Bool} short_start (OPTIONAL) Whether or not to add a padding 0 to the largest unit of the period.
 */
function TimeSourceDrawTransformedColor(id, x, y, xscale, yscale, angle, c1, c2, c3, c4, alpha, subsecond_precision, length, short_start = true)
{
    var align = draw_get_halign();
    var time_arr_str = __TimeSourceDrawPrepareTxt__(id, length, short_start, subsecond_precision);
    var time_str = string_concat_ext(time_arr_str);
    
    if (align == fa_center)
    {
        draw_text_transformed_color(x, y, time_str, xscale, yscale, angle, c1, c2, c3, c4, alpha);
        return time_str;
    }
    
    var time_length = array_length(time_arr_str);
    var i = (align == fa_right) ? time_length - 1 : 0; 
    
    var x_offset = 0;
    var y_offset = 0;
    
    repeat (time_length)
    {
        var time_txt = time_arr_str[i];

        draw_text_transformed_color(x + x_offset, y + y_offset, time_txt, xscale, yscale, angle, c1, c2, c3, c4, alpha);
        
        var x_off_to_add = lengthdir_x(string_width(time_txt) * xscale, angle);
        var y_off_to_add = lengthdir_y(string_width(time_txt) * xscale, angle);

        if (align == fa_right)
        {
            x_offset -= x_off_to_add;
            y_offset -= y_off_to_add;
            
            i--;
        }
        else
        { 
            x_offset += x_off_to_add;
            y_offset += y_off_to_add;
            
            i++;
        }
    }
    
    return time_str;
}


/**
 * Draws the period of the given time source as text with the given color and transformations.
 * @parameter {Real} x The x coordinate to draw the period at.
 * @parameter {Real} y The y coordinate to draw the period at.
 * @parameter {Real} xscale The horizontal scale (default 1).
 * @parameter {Real} yscale The vertical scale (default 1).
 * @parameter {Real} angle The angle of the period.
 * @parameter {Real} subsecond_precision How small the subsecond unit is. 0 = no subseconds are added to the array.
 * @parameter {Real} length How many different units should be returned.
 * @parameter {Bool} short_start (OPTIONAL) Whether or not to add a padding 0 to the largest unit of the period.
 */
function TimeSourceDrawTransformed(id, x, y, xscale, yscale, angle, subsecond_precision, length, short_start = true)
{
    var color = draw_get_color();
    var alpha = draw_get_alpha();
    
    return TimeSourceDrawTransformedColor(id, x, y, xscale, yscale, angle, color, color, color, color, alpha, subsecond_precision, length, short_start);
}


/**
 * Draws the period of the given time source as text with the given color and transformations.
 * @parameter {Real} x The x coordinate to draw the period at.
 * @parameter {Real} y The y coordinate to draw the period at.
 * @parameter {Constant.Color} c1 The colour for the top left of the period.
 * @parameter {Constant.Color} c2 The colour for the top right of the period.
 * @parameter {Constant.Color} c3 The colour for the bottom right of the period.
 * @parameter {Constant.Color} c4 The colour for the bottom left of the period.
 * @parameter {Real} alpha The alpha of the period.
 * @parameter {Real} subsecond_precision How small the subsecond unit is. 0 = no subseconds are added to the array.
 * @parameter {Real} length How many different units should be returned.
 * @parameter {Bool} short_start (OPTIONAL) Whether or not to add a padding 0 to the largest unit of the period.
 */
function TimeSourceDrawColor(id, x, y, c1, c2, c3, c4, alpha, subsecond_precision, length, short_start = true)
{
    return TimeSourceDrawTransformedColor(id, x, y, 1, 1, 0, c1, c2, c3, c4, alpha, subsecond_precision, length, short_start);
}


/**
 * Draws the period of the given time source as text with the given color and transformations.
 * @parameter {Real} x The x coordinate to draw the period at.
 * @parameter {Real} y The y coordinate to draw the period at.
 * @parameter {Real} subsecond_precision How small the subsecond unit is. 0 = no subseconds are added to the array.
 * @parameter {Real} length How many different units should be returned.
 * @parameter {Bool} short_start (OPTIONAL) Whether or not to add a padding 0 to the largest unit of the period.
 */
function TimeSourceDraw(id, x, y, subsecond_precision, length, short_start = true)
{
    return TimeSourceDrawTransformed(id, x, y, 1, 1, 0, subsecond_precision, length, short_start);
}