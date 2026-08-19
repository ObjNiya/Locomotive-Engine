#macro GLOBAL_STATE_PREFIX "State" // What every state functions name starts with.
#macro STATE_START_EVENT_NAME "Create" // What the name of every states start event ends with.
#macro STATE_END_EVENT_NAME "Destroy" // What the name of every states end event ends with.

global.stateEventFuncs = {};

/// @ignore
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


/**
 * Initializes the necessary variables on the current instance for the state machine.
 * @parameter {String} state_name_prefix The prefix for the current instances state functions.
 * @parameter {String} state_parent_name_prefix (OPTIONAL) If a state is set and it can't be found with the other prefix, the state machine will attempt to use this prefix instead. Default is no prefix.
 */
function SmcInit(state_name_prefix, state_parent_name_prefix = "")
{
    statePrefix = state_name_prefix;
    stateName = "";
    stateFullName = statePrefix;
    stateParentPrefix = state_parent_name_prefix;
    
    __SmcCacheStates__(statePrefix);
    __SmcCacheStates__(stateParentPrefix);
}


/**
 * Sets the state name prefix for the current instance.
 * @parameter {String} state_name_prefix The state name prefix to set.
 */
function SmcSetStateNamePrefix(state_name_prefix)
{
    statePrefix = state_name_prefix;
    __SmcCacheStates__(statePrefix);
}


/**
 * Sets the parent state name prefix that is used when a state is set and can't be found with the other prefix.
 * @parameter {String} state_parent_name_prefix The state parent name prefix to set.
 */
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


/**
 * Returns a ```STATE_EVENT_EXISTS``` enum member based on if the given state and event exist, or if it only exists with the parent prefix.
 * @parameter {String} state_name The name of the state to check the event for.
 * @parameter {String} event_name The name of the state event to check for.
 * @pure
 */
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


/**
 * Runs the given event of the current instances' state.
 * @parameter {String} name The name of the state to run.
 */
function SmcRunEvent(name)
{
    var ev_exists = SmcStateEventExists(stateName, name)
    if (ev_exists == STATE_EVENT_EXISTS.NO)
        return;
    
    var prefix = (ev_exists == STATE_EVENT_EXISTS.YES) ? statePrefix : stateParentPrefix;
    var event = global.stateEventFuncs[$ GLOBAL_STATE_PREFIX + prefix][$ stateName + name];

    event();
}


/**
 * Sets the given state and runs the end event of the previous state and the start event of the given one according to arguments two and three.
 * @parameter {String} name The state to set.
 * @parameter {Bool} run_start (OPTIONAL) Whether or not to run the given states start event. (If it exists). Default is true.
 * @parameter {Bool} run_start (OPTIONAL) Whether or not to run the previous states end event. (If it exists). Default is true.
 */
function SmcSetState(name, run_start = true, run_end = true)
{
    if (run_end && SmcStateEventExists(stateName, STATE_END_EVENT_NAME))
        SmcRunEvent(STATE_END_EVENT_NAME);
    
    stateName = name;
    stateFullname = statePrefix + stateName;
    
    if (run_start && SmcStateEventExists(stateName, STATE_START_EVENT_NAME))
        SmcRunEvent(STATE_START_EVENT_NAME);
}