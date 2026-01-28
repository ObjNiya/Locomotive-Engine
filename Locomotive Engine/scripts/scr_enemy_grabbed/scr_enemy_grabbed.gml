/// @ignore
function state_enemy_grabbed_start()
{
    sprite_index = stun_sprite;
    
    thrown_blur_afterimage_timer.start();
}

/// @ignore
function state_enemy_grabbed_step()
{
    thrown_blur_afterimage_timer.step();
}

/// @ignore
function state_enemy_grabbed_end()
{
    thrown_blur_afterimage_timer.stop();
}

function state_enemy_grabbed()
{
    return [state_enemy_grabbed_start, state_enemy_grabbed_step, state_enemy_grabbed_end];
}