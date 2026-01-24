/// @description This function will initialize the state machine variables on the current instance.
function state_machine_initialize()
{
    state = -1;
    state_end = -1;
}

/// @description This function will update the state machine on the current instance, running the states step event.
function state_machine_step()
{
    if (state != -1)
        state();
}

/// @description This function lets you change the state on the current instance.
/// @parameter {Function} state The function for your state that returns your states start, step and end events.
function state_machine_set_state(state)
{
    if (state_end != -1)
        state_end();
    
    if (state[0] != -1)
        state[0]();
    
    self.state = state[1];
    state_end = state[2];
}