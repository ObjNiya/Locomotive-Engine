#macro ENEMY_STATE_FAILSAVE var parent = object_get_parent(object_index) if (parent != par_enemy) { SmcSetState("None") Log(object_index, LOG_TYPES.WARNING, "Attempted to enter an enemy state despite not being an enemy! Setting state to empty...") return }

/**
 * Attacks the given Enemy instance and returns if the enemy was hurt or not.
 * @parameter {Instance.Id} enemy_id Which Enemy instance to attack.
 * @parameter {Instance.Id} attacker_id The instance that the Enemy was attacked by.
 * @parameter {Real} damage The amount of damage to deal to the Enemy.
 */
function AttackEnemy(enemy_id, attacker_id, damage = 1)
{
    with (enemy_id)
    {
        if (object_get_parent(object_index) != par_enemy || stateName == "Thrown")
            return false;
        
        hp -= damage;
        
        if (hp <= 0)
        {
            myKiller = attacker_id;
            instance_destroy();
        }
        else
        {
            image_xscale = -Side(sign(attacker_id.hsp), sign(attacker_id.image_xscale));
            
            visualXScale = 0.8;
            visualYScale = 1.3;
            
            movespeed = 12;
            vsp = -5;
            
            unstunableBuffer = 5;
            invincibleBuffer = 15;
            
            SmcSetState("Stunned");
            sound_instance_one_shot(sfx_player_mach2_bump, x, y);
        }
    }
    
    return true;
}

/**
 * Tries to stun the given Enemy instance and returns whether or not it has succeeded.
 * @parameter {Instance.Id} enemy_id Which Enemy instance to stun.
 * @parameter {Instance.Id} attacker_id The instance the Enemy was stunned by.
 */
function StunEnemy(enemy_id, attacker_id)
{
    with (enemy_id)
    {
        var parent = object_get_parent(enemy_id.object_index);
    
        if (parent != par_enemy || unstunnableTime > 0 || stateName == "Thrown")
            return false;
        
        image_xscale = -sign(attacker_id.image_xscale);
        dir = -image_xscale;
        
        visualXScale = 0.8;
        visualYScale = 1.3;
        
        movespeed = 12;
        vsp = (attacker_id.y - 180 - y) / 60;
        
        unstunnableTime = 15;
        invincibleBuffer = 5;
        
        SmcSetState("Stunned");
        
        sound_instance_one_shot(sfx_player_mach2_bump, x, y);
        PartSpawn(x, y, PART_TYPES.BANG);
        PartSpawn(x, y, PART_TYPES.SLAPSTARS_DEBRIS, 0, 0, ps_shape_rectangle, ps_distr_linear, false, 2);
        
        return true;
    }
}

/**
 * Tries to stomp the given Enemy instance and returns whether or not it succeeded.
 * @parameter {Id.Instance} enemy_id Which Enemy instance to stomp.
 * @parameter {Id.Instance} attacker_id The instance the Enemy was stomped by.
 */
function StompEnemy(enemy_id, attacker_id)
{
    with (enemy_id)
    {
        var parent = object_get_parent(enemy_id.object_index);
    
        if (parent != par_enemy || unstompableTime > 0 || !stompable || attacker_id.y >= y || stateName == "Thrown")
            return false;
        
        unstompableTime = 15;
        
        if (attacker_id.x != x)
            image_xscale = -sign(x - attacker_id.x);
        
        movespeed = 5;
        dir = sign(attacker_id.image_xscale);
        
        if (vsp >= 0 && grounded)
            vsp = -5;
        
        stunnedTimer = max(100, stunnedTimer);
        
        visualXScale = 0.6;
        visualYScale = 1.4;
        
        SmcSetState("Stunned");
        sound_instance_one_shot(sfx_enemystomped, x, y);
        
        return true;
    }
}

/**
 * Scares every Enemy that has the instance the function was called by in their sight.
 */
function ScareEnemies()
{
    with (par_enemy)
    {
        if (stateName != "Walk")
            continue;
        
        var in_sight = (collision_rectangle(x - (400 * (image_xscale == -1)), y - 130, x + (400 * (image_xscale == 1)), y + 90, other, false, false));
        if (!in_sight)
            continue;
        
        var wall_intersects = (collision_line(x, y, other.x, other.y, obj_solid, false, true) != noone);
        if (wall_intersects)
            continue;
        
        if (x != other.x)
            image_xscale = -sign(x - other.x);
            
        if (M_RandomInt(100) <= 5)
            sound_instance_one_shot(sfx_enemyscream, x, y);
        
        SmcSetState("Scared");
    }
}