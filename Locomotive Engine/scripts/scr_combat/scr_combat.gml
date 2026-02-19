#macro COMBAT_GET_MEETING (has_collision) ? instance_place(x + hsp, y + vsp, global.combat_objects) : instance_place(x, y, global.combat_objects)

enum COMBAT_GROUPS
{
    PLAYER,
    ENEMY,
    HAZARD,
}

/**
 * This function will initialize all the neccessary variables on the current instance to engage in combat with other instances.
 * A slew of functions will be defined, which are:
 * ```damage_function```, ```attack_function```, ```stun_function```, ```hurt_function``` and ```kill_function```. When they trigger can be found in their
 * descriptions; All of the previously mentioned functions will have the combat instance the current instance interacted with passed into them.
 */
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
    
    /**
     * This function will trigger when the current instances deals damage to another combat instance.
     * @parameter {Id.Instance} other_id The instance that is being dealt damage by the current instance.
     */
    damage_function = function(other_id)
    {
        
    }
    
    /**
     * This function will trigger when the current instances tries to deal damage to another combat instance and fails.
     * @parameter {Id.Instance} other_id The instance that the current instance tried to attack.
     */
    attack_function = function(other_id)
    {
        
    }
    
    /**
     * This function will trigger when the current instances' ```resistance``` is as high as the attackers ```strength```.
     * @parameter {Id.Instance} other_id The instance that has stunned the current instance.
     */
    stun_function = function(other_id)
    {
        
    }
    
    /**
     * This function will trigger when the current instances' ```resistance``` is lower than the attackers ```strength```.
     * @parameter {Id.Instance} other_id The instance that has hurt the current instance.
     */
    hurt_function = function(other_id)
    {
        
    }
    
    /**
     * This function will trigger when the current instances ```hp``` has been drained and killed.
     * @parameter {Id.Instance} other_id The instance that has killed the current instance.
     */
    kill_function = function(other_id)
    {
        
    }
    
    if (array_get_index(global.combat_objects, object_index) == -1)
        array_push(global.combat_objects, object_index);
}

/**
 * This function will update combat on the current instance so it can attack and be attacked.
 */
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

/**
 * This function will attach a hitbox to the current instance that will attack anything it touches; It itself is invulnerable.
 * @returns {Id.Instance}
 */
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