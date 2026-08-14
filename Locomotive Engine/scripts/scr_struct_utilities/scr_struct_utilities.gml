/**
 * Adds every numeric entry in the given strct together and returns the result.
 * @parameter {Struct} struct The struct to get the sum of.
 * @pure
 */
function StructGetSum(struct)
{
    var total = 0;
    var i = 0;
    
    var struct_names = struct_get_names(struct);
    var struct_name_count = array_length(struct_names);
    
    repeat (struct_name_count)
    {
        var entry = struct[$ struct_names[i]];
        
        if (is_numeric(entry))
            total += real(entry);
        i++;
    }
    
    return total;
}