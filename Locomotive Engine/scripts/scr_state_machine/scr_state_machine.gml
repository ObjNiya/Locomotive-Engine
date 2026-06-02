/**
 * This function will initialize the neccessary functions on the current instance to use the other state machine functions, which all start with ```smc_```.
 * The ```state_id``` contains the function ID of the current state, which can be used to identify the current state.
 */
function state_machine_initialize()
{
    stored_state = array_create(3, -1);
    state = stored_state;
    
    stored_state_id = -1;
    state_id = -1;
    
    // 0, State Start
    // 1, State Step,
    // 2, State End
}

/**
 * This function will update the state machine and run the step function of the current instances' state (if applicable).
 */
function smc_step()
{
    if (state[1] != -1)
        state[1]();
}

/**
 * This function will set the current instances' state to the given one.
 * @parameter {Function} state_to_set The state to set (as a function).
 */
function smc_set_state(state_to_set)
{
    if (state[2] != -1)
        state[2]();

    var new_states = state_to_set();
       
    if (new_states[0] != -1)
        new_states[0]();
    
    state = new_states;
    state_id = state_to_set;
}

/**
 * This function will store the current instances' state to be later restored using the ```smc_restore_state``` function.
 */
function smc_store_state()
{
    stored_state_id = state_id;
    stored_state = state;
}

/**
 * This function will restore the current instances' state that was last stored using ```smc_store_state```, unless the stored state does not exist.
 */
function smc_restore_state()
{
    if (stored_state_id != -1)
        smc_set_state(stored_state_id);
}

function smc_empty_state()
{
    return [-1, -1, -1];
}

enum STATE_EVENTS
{
    CREATE = 0,
    DESTROY = 1,
    STEP = 2,
    STEP_BEGIN = 3,
    STEP_END = 4,
    ALARM0 = 5,
    ALARM1 = 6,
    ALARM2 = 7,
    ALARM3 = 8,
    ALARM4 = 9,
    ALARM5 = 10,
    ALARM6 = 11,
    ALARM7 = 12,
    ALARM8 = 13,
    ALARM9 = 14,
    ALARM10 = 15,
    ALARM11 = 16,
    OUTSIDE_ROOM = 17,
    INTERSECT_BOUNDARY = 18,
    OUTSIDE_VIEW0 = 19,
    OUTSIDE_VIEW1 = 20,
    OUTSIDE_VIEW2 = 21,
    OUTSIDE_VIEW3 = 22,
    OUTSIDE_VIEW4 = 23,
    OUTSIDE_VIEW5 = 24,
    OUTSIDE_VIEW6 = 25,
    OUTSIDE_VIEW7 = 26,
    BOUNDARY_VIEW0 = 27,
    BOUNDARY_VIEW1 = 28,
    BOUNDARY_VIEW2 = 29,
    BOUNDARY_VIEW3 = 30,
    BOUNDARY_VIEW4 = 31,
    BOUNDARY_VIEW5 = 32,
    BOUNDARY_VIEW6 = 33,
    BOUNDARY_VIEW7 = 34,
    ROOM_START = 35,
    ROOM_END = 36,
    ANIMATION_END = 37,
    ANIMATION_UPDATE = 38,
    ANIMATION_EVENT = 39,
    END_OF_PATH = 40,
    USER0 = 41,
    USER1 = 42,
    USER2 = 43,
    USER3 = 44,
    USER4 = 45,
    USER5 = 46,
    USER6 = 47,
    USER7 = 48,
    USER8 = 49,
    USER9 = 50,
    USER10 = 51,
    USER11 = 52,
    USER12 = 53,
    USER13 = 54,
    USER14 = 55,
    USER15 = 56,
    DRAW = 57,
    DRAW_BEGIN = 58,
    DRAW_END = 59,
    DRAW_PRE = 60,
    DRAW_POST = 61,
    DRAW_GUI = 62,
    DRAW_GUI_BEGIN = 63,
    DRAW_GUI_END = 64,
}

global.stateEventNames = [
    "Create",
    "Destroy",
    "Step",
    "StepBegin",
    "StepEnd",
    "Alarm0",
    "Alarm1",
    "Alarm2",
    "Alarm3",
    "Alarm4",
    "Alarm5",
    "Alarm6",
    "Alarm7",
    "Alarm8",
    "Alarm9",
    "Alarm10",
    "Alarm11",
    "OutsideRoom",
    "IntersectBoundary",
    "OutsideView0",
    "OutsideView1",
    "OutsideView2",
    "OutsideView3",
    "OutsideView4",
    "OutsideView5",
    "OutsideView6",
    "OutsideView7",
    "BoundaryView0",
    "BoundaryView1",
    "BoundaryView2",
    "BoundaryView3",
    "BoundaryView4",
    "BoundaryView5",
    "BoundaryView6",
    "BoundaryView7",
    "RoomStart",
    "RoomEnd",
    "AnimationEnd",
    "AnimationUpdate",
    "AnimationEvent",
    "EndOfPath",
    "User0",
    "User1",
    "User2",
    "User3",
    "User4",
    "User5",
    "User6",
    "User7",
    "User8",
    "User9",
    "User10",
    "User11",
    "User12",
    "User13",
    "User14",
    "User15",
    "Draw",
    "DrawBegin",
    "DrawEnd",
    "DrawPre",
    "DrawPost",
    "DrawGui",
    "DrawGuiBegin",
    "DrawGuiEnd"
]

global.stateEventFuncs = {};

function __CacheState__(state_name)
{
    if (global.stateEventFuncs[$ state_name] == undefined)
        struct_set(global.stateEventFuncs, state_name, []);
    
    var i = 0;
    var ev_count = array_length(global.stateEventNames);
    
    repeat (ev_count)
    {
        var substate = state_name + global.stateEventNames[i];
        
        if (!script_exists(substate))
        {
            global.stateEventFuncs[$ state_name][i] = -1;
            i++;
            continue;
        }
        
        global.stateEventFuncs[$ state_name][i] = asset_get_index(substate);
        i++;
    }
}


function SmcInit()
{
    stateName = -1;
    stateFuncs = [];
    stateHistory = {};
}


function SmcSetState(state_name)
{
    if (global.stateEventFuncs[$ state_name] == undefined)
        __CacheState__(state_name);
    
    SmcRunEvent(STATE_EVENTS.DESTROY);
    
    stateName = state_name;
    stateFuncs = global.stateEventFuncs[$ stateName];
    
    SmcRunEvent(STATE_EVENTS.CREATE);
}


function SmcRunEvent(state_event)
{
    state_event = stateFuncs[state_event];
    
    if (state_event == -1)
        return;
    
    state_event();
}


function SmcAddToHistory(entry_name)
{
    struct_set(stateHistory, entry_name, stateFuncs);
}


function SmcDeleteFromHistory(entry_name)
{
    struct_remove(stateHistory, entry_name);
}