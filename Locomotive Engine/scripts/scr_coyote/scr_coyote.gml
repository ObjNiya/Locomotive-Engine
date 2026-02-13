#macro COYOTE_TIMER_MAX 8

function coyote_initialize()
{
    coyote_time = COYOTE_TIMER_MAX;
    can_jump = true;
}

function coyote_step()
{
    if (grounded)
    {
        coyote_time = COYOTE_TIMER_MAX;
        can_jump = true;
        
        return;
    }
    
    coyote_time = max(coyote_time - 1, 0);
    can_jump = (coyote_time > 0);
}

function coyote_jump()
{
    coyote_time = 0;
    can_jump = false;
}