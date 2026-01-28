/// @ignore
function state_enemy_scared_scared_start()
{
    sprite_index = scared_sprite;
    
    hsp = 0;
    
    if (scared_timer.started)
        return;
    
    if (grounded)
        vsp = -3;
    else
        vsp = 0;
    
    scared_timer.start();
}

/// @ignore
function state_enemy_scared_scared_step()
{
    scared_timer.step();
}

/// @ignore
function state_enemy_scared_scared_end()
{
    scared_timer.stop();
}

function state_enemy_scared()
{
    return [state_enemy_scared_scared_start, state_enemy_scared_scared_step, state_enemy_scared_scared_end];
}