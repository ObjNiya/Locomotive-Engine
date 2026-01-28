function scare_enemy(forced = false)
{
    with (par_enemy)
    {
        var attacker = other;
        
        var in_sight = (collision_rectangle(x - 400, y - 130, x + 400, y + 90, attacker, false, false));
        var facing_attacker = (sign(image_xscale) == -sign(attacker.image_xscale));
        var wall_intersects = (collision_line(x, y, attacker.x, attacker.y, obj_solid, false, true) != noone);
        
        draw_set_alpha(0.5)
        draw_rectangle(x - 400, y - 130, x + 400, y + 90, false)
        draw_set_alpha(1)
        
        if ((!in_sight || !facing_attacker || wall_intersects) && !forced)
            return false;
        
        if (x != attacker.x)
            image_xscale = -sign(x - attacker.x);
        
        if (state_step != state_enemy_scared_scared_step)
            state_machine_set_state(state_enemy_scared());
        
        scared_timer.start();
        
        return true;
    }
}

function grab_enemy(forced = false)
{
    var enemy_instance = instance_place(x, y, par_enemy);
    
    if (forced && !instance_exists(enemy_instance))
        enemy_instance = instance_nearest(x, y, par_enemy);
    
    if (!instance_exists(enemy_instance))
        return noone;
    
    trace ("Enemy Grabbed")
    return enemy_instance;
}

function hurt_enemy(forced = false)
{
    var enemy_instance = instance_place(x, y, par_enemy);
    
    if (forced && !instance_exists(enemy_instance))
        enemy_instance = instance_nearest(x, y, par_enemy);
    
    if (!instance_exists(enemy_instance))
        return noone;
    
    if (enemy_instance.hp-- <= 0)
        instance_destroy(enemy_instance);
}