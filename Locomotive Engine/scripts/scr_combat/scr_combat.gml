#macro COMBAT_GET_MEETING (has_collision) ? instance_place(x + hsp, y + vsp, global.combat_objects) : instance_place(x, y, global.combat_objects)

enum COMBAT_GROUPS
{
    PLAYER,
    ENEMY,
    HAZARD,
}

function combat_initialize()
{
    damage = 1;
    strength = 1;
    resistance = 1;
    hp = 1;
    
    has_collision = false;
    attacking = false;
    invincible = false;
    untouchable = false;
    
    group = COMBAT_GROUPS.ENEMY;
    
    attack_hitbox = noone;
    
    damage_function = function(other_id)
    {
        
    }
    
    attack_function = function(other_id)
    {
        
    }
    
    stun_function = function(other_id)
    {
        
    }
    
    hurt_function = function(other_id)
    {
        
    }
    
    kill_function = function(other_id)
    {
        
    }
    
    if (array_get_index(global.combat_objects, object_index) == -1)
        array_push(global.combat_objects, object_index);
}

function combat_step()
{
    var combat_id = COMBAT_GET_MEETING;
    
    if (combat_id == noone)
        return;
    
    if (!attacking || group == combat_id.group || combat_id.untouchable)
        return;
    
    with (combat_id)
    {
        var can_damage = !invincible && other.strength > resistance;
        
        if (!can_damage)
        {
            other.attack_function();
            
            if (other.strength == resistance)
                stun_function(other);
            
            return;
        }
        
        other.damage_function();
        hp -= damage;
        
        if (hp > 0)
            hurt_function(other);
        else
            kill_function(other);
    }
}

function combat_add_attack_hitbox()
{
    with (instance_create(x, y, obj_attack_hitbox))
    {
        strength = other.strength;
        resistance = other.resistance;
        
        group = other.group;
        
        owner_id = other.id;
        
        return id;
    }
}