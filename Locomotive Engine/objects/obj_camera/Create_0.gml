event_inherited();

enum CAM_LOCK_MODE
{
    NONE,
    PART,
    FULL,
}

viewport = instance_number(object_index) - 1;

if (viewport > 7)
{
    instance_destroy();
    exit;
}

fmod_studio_system_set_num_listeners(viewport);
listenerAttr = new Fmod3DAttributes();

with (listenerAttr) 
{
    forward.z = 1;
    up.y = 1; 
}

xOffset = 0;
yOffset = 0;
zoom = 1;

xLocked = CAM_LOCK_MODE.NONE;
yLocked = CAM_LOCK_MODE.NONE;
zoomLocked = CAM_LOCK_MODE.NONE;

function ValueOffseter() constructor 
{
    static AddKey = function(name)
    {
        if (is_undefined(self[$ name]))
            self[$ name] = 0;
    }
    
    static SetKey = function(name, value)
    {
        if (!is_undefined(self[$ name]))
            self[$ name] = value;
    }
     
    static RemoveKey = function(name)
    {
        struct_remove(self, name);
    }
    
    static GetTotalValue = function()
    {
        var names = struct_get_names(self);
        var names_count = struct_names_count(names);
        
        var i = 0;
        var total = 0;
        
        repeat (names_count)
        {
            var name = names[i];
            
            if (is_real(self[$ name]))
                total += self[$ name];
        }
        
        return total;
    }
}

xOffsets = new ValueOffseter();
yOffsets = new ValueOffseter();
zooms = new ValueOffseter();
