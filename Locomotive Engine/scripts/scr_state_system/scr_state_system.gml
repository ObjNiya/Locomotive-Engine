/// @description This function will initialize the state machine variables on the current instance.
function state_machine_initialize()
{
    state_start = -1;
    state_step = -1;
    state_end = -1;
    
    previous_state_start = -1;
    previous_state_step = -1;
    previous_state_end = -1;
}

/// @description This function will update the state machine on the current instance, running the states step event.
function state_machine_step()
{
    if (state_step != -1)
        state_step();
}

/// @description This function lets you change the state on the current instance.
/// @parameter {Function} state The function for your state that returns your states start, step and end events.
function state_machine_set_state(state)
{
    if (state_end != -1)
        state_end();
    
    if (state[0] != -1)
        state[0]();
    
    state_start = state[0];
    state_step = state[1];
    state_end = state[2];
}

function state_machine_store_state()
{
    previous_state_start = state_start;
    previous_state_step = state_step;
    previous_state_end = state_end;
}

/// @description This function lets you change the state to the previous one, like a rollback.
function state_machine_set_previous_state()
{
    state_machine_set_state([previous_state_start, previous_state_step, previous_state_end]);
}