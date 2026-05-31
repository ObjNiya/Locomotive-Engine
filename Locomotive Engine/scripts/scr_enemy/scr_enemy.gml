function HurtEnemy(damage = 1, enemy_id = noone)
{
    if (enemy_id == noone)
        enemy_id = instance_place(x, y, par_enemy);
    if (enemy_id == noone)
        return false;
    
    with (enemy_id)
    {
        if (invincibleBuffer > 0)
            return false;
        
        hp -= damage;
        
        if (hp <= 0)
        {
            my_killer = other.id;
            instance_destroy();
        }
        else
        {
            image_xscale = -side(sign(other.hsp), sign(other.image_xscale));
            
            visual_xscale = 0.8;
            visual_yscale = 1.3;
            
            movespeed = 12;
            vsp = -5;
            
            unstunableBuffer = 5;
            invincibleBuffer = 15;
            
            smc_set_state(state_enemy_stunned);
            
            sound_instance_one_shot(sfx_player_mach2_bump, x, y);
        }
    }
    
    return true;
}

function StunEnemy(enemy_id = noone)
{
    if (enemy_id == noone)
        enemy_id = instance_place(x, y, par_enemy);
    if (enemy_id == noone)
        return false;
    
    with (enemy_id)
    {
        if (invincibleBuffer > 0 || unstunableBuffer > 0)
            return false;
        
        image_xscale = -sign(other.image_xscale);
        
        visual_xscale = 0.8;
        visual_yscale = 1.3;
        
        movespeed = 12;
        vsp = (other.y - 180 - y) / 60;
        
        unstunableBuffer = 15;
        invincibleBuffer = 5;
        
        smc_set_state(state_enemy_stunned);
        
        sound_instance_one_shot(sfx_player_mach2_bump, x, y);
        instance_create(x, y, obj_bang_particle);
        
        repeat (2)
        {
            with (instance_create(x, y, obj_slap_star_debris))
                vspeed = irandom_range(-6, -11);
        }
    }
    
    return true;
}

function ScareEnemy()
{
    with (par_enemy)
    {
        var in_sight = (collision_rectangle(x - (400 * (image_xscale == -1)), y - 130, x + (400 * (image_xscale == 1)), y + 90, other, false, false));
        if (!in_sight)
            continue;
        
        var wall_intersects = (collision_line(x, y, other.x, other.y, obj_solid, false, true) != noone);
        if (wall_intersects)
            continue;
        
        if (x != other.x)
            image_xscale = -sign(x - other.x);
    
        if (state_id != state_enemy_scared)
            smc_set_state(state_enemy_scared);
    
        scared_timer.Start();
    }
}