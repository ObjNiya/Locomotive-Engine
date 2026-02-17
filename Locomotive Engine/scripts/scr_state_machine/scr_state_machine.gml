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