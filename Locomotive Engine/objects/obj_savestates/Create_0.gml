/*function SaveState() constructor 
{
    fileIndex = 1;
    fileName = string_concat("saveState", fileIndex, ".json");
    state = {
        varGlobals: {},
        varOthers: {},
        instances: []
    };
    
    while (file_exists(working_directory + fileName))
    {
        var prev_index = string_digits(fileName);
        
        fileIndex++;
        string_replace(fileName, prev_index, string(fileIndex));
    }
    
    
    static Save = function()
    {
        struct_foreach(global, function(name, value) {
            if (!is_callable(value) && !string_starts_with(name, "@@"))
                state.varGlobals[$ name] = value;
        });
        
        with (all)
        {
            struct_foreach(self, function(name, value) {
                s = 
            })
        }
        
        rm = room;
        varGlobals = global;
        instances = [];
        
        with (all)
        {
            var my_vars = {};
            var var_names = struct_get_names(self);
            
            
            var i = 0;
            struct_foreach(self, function(name, value) {
            })
            
            array_push(other.instances, self);
    }
    
    static Load = function()
    {
        struct_foreach(varGlobals, function(name, value) {
            global[$ name] = value;
        });
        
        struct_foreach(instances, function(name, value) {
            //InstanceCreate()
        })    
    }
}