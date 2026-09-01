enum PRIORITY
{
    MIN = 8,
    
    LOWEST = 7,
    LOWER = 6,
    LOW = 5,
    
    MID = 4,
    
    HIGH = 3,
    HIGHER = 2,
    HIGHEST = 1,
    
    MAX = 0,
}

#macro DEFAULT_LAYER "Instances_1"
#macro DEFAULT_PRIORITY PRIORITY.MID // What the default depth is for objects that don't have a depth set

with (global)
{
    defaultMasterPriority = 0;
    
    __defaultLayerId__ = DEFAULT_LAYER;
    __prevRm__ = -1;
    __insLayers__ = [];
    __masterPrioritiesNames__ = {};
    __priorities__ = ds_map_create();
}

/// @ignore
function __PriorityMakeLayers__()
{
    global.__prevRm__ = room;
    global.__insLayers__ = [];
    global.__defaultLayerId__ = layer_get_id(DEFAULT_LAYER);
    
    var layers = layer_get_all();
    var layer_count = array_length(layers);
    var ins_layers = [];
    var i = 0;
    
    repeat (layer_count)
    {
        var lay = layers[i];
        var lay_name = layer_get_name(lay);
        lay_name = string_lower(lay_name);
        
        if (string_starts_with(lay_name, "instances"))
            array_push(ins_layers, lay);
        
        i++;
    }
    
    global.__insLayers__ = array_create(9 * array_length(ins_layers), -1);
    array_foreach(ins_layers, function(ins_lay, index) {
        var base_depth = layer_get_depth(ins_lay);
        var i = -4;
        
        repeat (9)
        {
            var ind = (i + 4) * (index + 1);
            
            if (i != 0)
                global.__insLayers__[ind] = layer_create(base_depth + i);
            else
                global.__insLayers__[ind] = ins_lay;
            
            i++;
        }
    });
}


/**
 * Returns the amount of Master Priorities that currently exist.
 * @pure
 */
function MasterPriorityGetCount()
{
    return floor(array_length(global.__insLayers__) / 9);
}


/**
 * Gives the given Master Priority a name for easier accessing as the Master Priority indicies may shift.
 * @parameter {Real} master_priority The index of the Master Priority to give a name to.
 * @parameter {String} master_priority_name The name to give to the given Master Priority.
 */
function MasterPriorityNameSet(master_priority, master_priority_name)
{
    global.__masterPrioritiesNames__[$ master_priority_name] = master_priority;
}


/**
 * Returns the index for the given Master Priority from its name.
 * @parameter {String} master_priority_name The name of the Master Priority to get the index of.
 * @returns {Real}
 * @pure
 */
function MasterPriorityGetFromName(master_priority_name)
{
    return global.__masterPrioritiesNames__[$ master_priority_name]
}


/**
 * Removes every Master Priorities name for when their indicies may shift and have to be reassigned.
 */
function MasterPriorityNamesRemove()
{
    global.__masterPrioritiesNames__ = {};
}


/**
 * Returns if a Priority has been defined with the given key.
 * @parameter {Any} priority_key Which key to check for.
 * @pure
 */
function PriorityExists(priority_key)
{
    return ds_map_exists(global.__priorities__, priority_key);
}


/**
 * Sets the Priority for the given key(s).
 * @parameter {Any} priority_key The key or keys to set the Priority for.
 * @parameter {Real} target_priority Which Priority to assign to the key from the ```PRIORITY``` enum.
 */
function PrioritySet(priority_key, target_priority)
{
    if (is_array(priority_key))
    {
        var obj_count = array_length(priority_key);
        var i = 0;
        
        repeat (obj_count)
        {
            PrioritySet(priority_key[i], target_priority);
            i++;
        }
        
        return;
    }

    global.__priorities__[? priority_key] = target_priority;
}


/**
 * Returns the Priority for the given key. If the given key is an object asset and has no Priority, it will try looking trough all its parents to find a Priority.
 * @parameter  {Any} priority_key Which key to get the Priority of.
 */
function PriorityGet(priority_key)
{
    while (!PriorityExists(priority_key) && asset_get_type(priority_key) == asset_object && priority_key != -100)
        priority_key = object_get_parent(priority_key);
    
    if (priority_key == -1 || !PriorityExists(priority_key))
        return DEFAULT_PRIORITY;
    
    return global.__priorities__[? priority_key];
}


/**
 * Returns the layer of the given Priority. If no layer exists for the given one, it will return -1.
 * @parameter {Any} priority_or_key (OPTIONAL) Which Priority to get the layer of from the ```PRIORITY``` enum, or a key to get the Priority from. Default is the current instances `object_index`.
 * @parameter {Bool} priority_is_key (OPTIONAL) Whether or not the previous argument is a key or a number. Default is True.
 * @parameter {Real|String} master_priority (OPTIONAL) If there's several Master Priorities, this argument specifies which Master Priority to look for layers from. Default is the global default Master Priority.
 */
function PriorityGetLay(priority_or_key = object_index, priority_is_key = true, master_priority = global.defaultMasterPriority)
{
    if (global.__prevRm__ != room)
        __PriorityMakeLayers__();

    if (priority_is_key)
        priority_or_key = PriorityGet(priority_or_key);
    else
        priority_or_key = real(priority_or_key);
    
    if (is_string(master_priority))
        master_priority = MasterPriorityGetFromName(master_priority);
    
    master_priority = clamp(master_priority, 0, MasterPriorityGetCount());
    
    var index = priority_or_key * (master_priority + 1);

    if (!ArrayInBounds(global.__insLayers__, index))
        return -1;
    
    return global.__insLayers__[index];
}


/**
 * Sets the current instances layer to the one of the given Priority.
 * @parameter {Any} priority_or_key (OPTIONAL) Which Priorities layer from the `PRIORITY` enum to set the current instances layer to, or a key to get the Priority from. Default is the current instances `object_index`.
 * @parameter {Bool} priority_is_key (OPTIONAL) Whether or not the previous argument is a key or a number. Default is True.
 * @parameter {Real|String} master_priority (OPTIONAL) If there's several Master Priorities, this argument specifies which Master Priority to look for layers from. Default is the global default Master Priority.
 */
function SetLayer(priority_or_key = object_index, priority_is_key = true, master_priority = global.defaultMasterPriority)
{
    var lay = PriorityGetLay(priority_or_key, priority_is_key, master_priority);
    if (lay == -1)
        lay = global.__defaultLayerId__;
    
    layer = lay;
    depth = layer_get_depth(layer);
}

#region World

// Minimum

PrioritySet([
    obj_solid,
    par_points,
    par_room_switcher,
    par_afterimage,
    obj_doorkey,
    obj_outlet,
    obj_spring,
    obj_amiibox,
    obj_treasurecatripi,
    obj_secretegg,
    obj_secretegg_spawn,
    obj_escapepointer,
    obj_patrick_pillar,
    obj_patrickblock,
    obj_cutoff
], PRIORITY.MIN);

// Lowest

PrioritySet([
    obj_block,
    obj_beatbox,
    obj_levelpainting,
    obj_exitportal
], PRIORITY.LOWEST);

// Lower

PrioritySet(spr_tauntspark_effect, PRIORITY.LOWER);

// Low

PrioritySet([
    obj_followplayersprite,
    obj_treasurecatripi,
    obj_following_effect,
], PRIORITY.LOW);

// Medium

PrioritySet(par_enemy, PRIORITY.MID);

// High

PrioritySet([
    obj_player,
    obj_points_number
], PRIORITY.HIGH);

// Max

PrioritySet([
    spr_charge_effect,
    spr_grndpnd_effect,
    obj_warppipe,
    obj_pointsloss_effect,
    obj_gibs,
], PRIORITY.MAX);

#endregion


#region HUD

// Min

PrioritySet([par_cutscene, obj_titlecard], PRIORITY.MIN);

// Lowest

PrioritySet(par_roomtransition, PRIORITY.LOWEST);

// Lower

PrioritySet([
    obj_hud_book,
    obj_hud_tv
], PRIORITY.LOWER);

// Low

PrioritySet(obj_its_showtime, PRIORITY.LOW);

// Middle

PrioritySet(obj_hud_timer, PRIORITY.MID);

// Highest

PrioritySet([obj_techdifficulties_out, obj_loadingscreen], PRIORITY.HIGHEST);

// Max

PrioritySet(obj_shell, PRIORITY.MAX);

#endregion