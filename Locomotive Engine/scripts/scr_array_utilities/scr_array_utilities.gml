function array_get_sum(array)
{
    var total = 0;
    var i = 0;
    var array_len = array_length(array);
    
    repeat (array_len)
    {
        var val = array[i];
        
        if (is_numeric(val))
            total += val;
        
        i++;
    }
    
    return total;
}