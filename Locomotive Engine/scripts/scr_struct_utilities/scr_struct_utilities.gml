function struct_get_sum(struct)
{
    var total = 0;
    var i = 0;
    
    var struct_names = struct_get_names(struct);
    var struct_name_count = array_length(struct_names);
    
    repeat (struct_name_count)
    {
        total += struct[$ struct_names[i]];
        i++;
    }
    
    return total;
}