#macro GLOBAL_STATE_PREFIX "State"
#macro STATE_START_EVENT_NAME "Create"
#macro STATE_END_EVENT_NAME "Destroy"

global.stateEventFuncs = {};

function __SmcCacheStates__(name_prefix)
{
    if (struct_exists(global.stateEventFuncs, name_prefix) || name_prefix == "")
        return;
    
    global.stateEventFuncs[$ GLOBAL_STATE_PREFIX + name_prefix] = {};
    
    var search_prefix = GLOBAL_STATE_PREFIX + name_prefix;
    var scripts = asset_get_ids(asset_script);
    var script_count = array_length(scripts);
    var i = 0;
    
    repeat (script_count)
    {
        var scr_name = script_get_name(scripts[i]);
        
        if (!string_starts_with(scr_name, search_prefix))
        {
            i++;
            continue;
        }
        
        scr_name = string_trim_start(scr_name, [search_prefix]);
        global.stateEventFuncs[$ search_prefix][$ scr_name] = scripts[i];
        
        i++;
    }
}

function SmcInit(state_name_prefix, state_parent_name_prefix = "")
{
    statePrefix = state_name_prefix;
    stateName = "";
    stateFullName = statePrefix;
    stateParentPrefix = state_parent_name_prefix;
    
    __SmcCacheStates__(statePrefix);
    __SmcCacheStates__(stateParentPrefix);
}

function SmcSetStateNamePrefix(state_name_prefix)
{
    statePrefix = state_name_prefix;
    __SmcCacheStates__(statePrefix);
}

function SmcSetStateParentNamePrefix(state_parent_name_prefix)
{
    stateParentPrefix = state_parent_name_prefix;
    __SmcCacheStates__(stateParentPrefix);
}

enum STATE_EVENT_EXISTS
{
    NO,
    YES,
    PARENT,
}

function SmcStateEventExists(state_name, event_name)
{
    var exists = STATE_EVENT_EXISTS.YES;
    
    if (!struct_exists(global.stateEventFuncs, GLOBAL_STATE_PREFIX + statePrefix))
        exists = STATE_EVENT_EXISTS.NO;
    else if (!struct_exists(global.stateEventFuncs[$ GLOBAL_STATE_PREFIX + statePrefix], state_name + event_name))
        exists = STATE_EVENT_EXISTS.NO;
    
    if (exists == STATE_EVENT_EXISTS.YES)
        return exists;
    
    exists = STATE_EVENT_EXISTS.PARENT;
    
    if (!struct_exists(global.stateEventFuncs, GLOBAL_STATE_PREFIX + stateParentPrefix))
        exists = STATE_EVENT_EXISTS.NO;
    else if (!struct_exists(global.stateEventFuncs[$ GLOBAL_STATE_PREFIX + stateParentPrefix], state_name + event_name))
        exists = STATE_EVENT_EXISTS.NO;
    
    return exists;
}

function SmcRunEvent(name)
{
    var ev_exists = SmcStateEventExists(stateName, name)
    if (ev_exists == STATE_EVENT_EXISTS.NO)
        return;
    
    var prefix = (ev_exists == STATE_EVENT_EXISTS.YES) ? statePrefix : stateParentPrefix;
    var event = global.stateEventFuncs[$ GLOBAL_STATE_PREFIX + prefix][$ stateName + name];

    event();
}

function SmcSetState(name, run_start = true, run_end = true)
{
    if (run_end && SmcStateEventExists(stateName, STATE_END_EVENT_NAME))
        SmcRunEvent(STATE_END_EVENT_NAME);
    
    stateName = name;
    stateFullname = statePrefix + stateName;
    
    if (run_start && SmcStateEventExists(stateName, STATE_START_EVENT_NAME))
        SmcRunEvent(STATE_START_EVENT_NAME);
}