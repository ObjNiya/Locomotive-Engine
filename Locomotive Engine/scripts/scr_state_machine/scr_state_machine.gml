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

function smc_step()
{
    if (state[1] != -1)
        state[1]();
}

function smc_set_state(state_to_set)
{
    if (state[2] != -1)
        state[2]();
 
    var state_array = state_to_set()
       
    if (state_array[0] != -1)
        state_array[0]();
    
    state = state_array;
    state_id = state_to_set;
}

function smc_store_state()
{
    stored_state_id = state_id;
    stored_state = state;
}

function smc_restore_state()
{
    smc_set_state(stored_state_id);
}

function smc_get_state()
{
    return state_id;
}