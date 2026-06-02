#macro ENEMY_STATE_FAILSAVE var parent = object_get_parent(object_index) if (parent != par_enemy) { SmcSetState("None") Log(object_index, LOG_TYPES.WARNING, "Attempted to enter an enemy state despite not being an enemy! Setting state to empty...") return }

/**
 * This function will attack the given Enemy, meant to be exclusively called by obj_hitbox.
 * @parameter {Instance.Id} enemy_id Which Enemy instance to attack.
 * @parameter {Instance.Id} attacker_id The instance that Enemy was attacked by.
 * @parameter {Real} damage The amount of damage to deal to the given Enemy.
 */
function AttackEnemy(enemy_id, attacker_id, damage = 1)
{
    var parent = object_get_parent(enemy_id.object_index);
    
    if (parent != par_enemy)
        return;
    
    with (enemy_id)
    {
        hp -= damage;
        
        if (hp <= 0)
        {
            my_killer = attacker_id;
            instance_destroy();
        }
        else
        {
            image_xscale = -side(sign(attacker_id.hsp), sign(attacker_id.image_xscale));
            
            visual_xscale = 0.8;
            visual_yscale = 1.3;
            
            movespeed = 12;
            vsp = -5;
            
            unstunableBuffer = 5;
            invincibleBuffer = 15;
            
            SmcSetState("Stunned");
            
            sound_instance_one_shot(sfx_player_mach2_bump, x, y);
        }
    }
}

/**
 * This function will stun the given Enemy, meant to be exclusively called by obj_hitbox.
 * @parameter {Instance.Id} enemy_id Which Enemy instance to stun.
 * @parameter {Instance.Id} attacker_id The instance that Enemy was stunned by.
 */
function StunEnemy(enemy_id, attacker_id)
{
    var parent = object_get_parent(enemy_id.object_index);
    
    if (parent != par_enemy)
        return;
    
    with (enemy_id)
    {
        if (unstunableBuffer > 0)
            return false;
        
        image_xscale = -sign(attacker_id.image_xscale);
        
        visual_xscale = 0.8;
        visual_yscale = 1.3;
        
        movespeed = 12;
        vsp = (attacker_id.y - 180 - y) / 60;
        
        unstunableBuffer = 15;
        invincibleBuffer = 5;
        
        SmcSetState("Stunned");
        
        sound_instance_one_shot(sfx_player_mach2_bump, x, y);
        instance_create(x, y, obj_bang_particle);
        
        repeat (2)
        {
            with (instance_create(x, y, obj_slap_star_debris))
                vspeed = irandom_range(-6, -11);
        }
    }
}

function ScareEnemies()
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
    
        if (stateName != "Scared")
            SmcSetState("Scared");
    
        scared_timer.Start();
    }
}