var structs_to_del = [];

var struct_count = array_length(structs);
var i = 0;

repeat (struct_count)
{
    var struct = structs[i];
    
    if (!instance_exists(struct.parent) && struct.parent != -1)
    {
        array_delete(structs, i, 1);
        continue;
    }
    
    structs[i].step();
    i++;
}