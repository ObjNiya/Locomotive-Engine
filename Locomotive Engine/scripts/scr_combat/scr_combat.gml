/**
 * Creates a new hitbox object, set its ```persistent``` and ```mask_index``` variables to that of the current instance and return its id.
 * @returns {Instance.Id}
 */
function HitboxCreate()
{
    with (InstanceCreate(x, y, obj_hitbox))
    {
        owner = other.id;
        persistent = other.persistent;
        mask_index = other.mask_index;
        
        return id;
    }
}


/**
 * Updates all of the given hitbox instances position, scale and angle to that of the current instance.
 */
function HitboxesStep()
{
    var i = 0;
    
    repeat (argument_count)
    {
        with (argument[i]) 
        {
            x = other.x + xOffset;
            y = other.y + yOffset;
            image_xscale = other.image_xscale * xScaleMult;
            image_yscale = other.image_yscale * yScaleMult;
            image_angle = other.image_angle + angleOffset;
        }
        
        i++;
    }
}


/**
 * Makes the given hitbox instance try to attack the given target that was previously defined on the hitbox instance and return the id of the attacked instance.
 * @parameter {Instance.Id} hitbox_id Which hitbox instance to attack with.
 * @parameter {String} target Which target on the hitbox's ```targets``` struct to attack.
 * @parameter {Bool} auto_exec Whether or not the hitbox should run the attack function assigned to the given target. (Default is true)
 * @returns {Instance.Id}
 */
function HitboxDoAttack(hitbox_id, target, auto_exec = true)
{
    with (hitbox_id)
    {
        target = targets[$ target];
        
        var meeting_target = instance_place(x, y, target.obj);
        if (meeting_target == noone)
            return noone;
        
        var attacker = (instance_exists(owner)) ? owner : id;
        
        if (auto_exec && meeting_target.invincibleBuffer <= 0)
            target.attackFunc(meeting_target, attacker);
        
        return meeting_target;
    }
}

/**
 * Creates the neccessary variables for taking damage and getting parried on the current instance.
 */
function HurtSysInit()
{
    invincibleBuffer = 0;
    
    parryable = true;
    parryLethal = true;
}

/**
 * Counts down the Invinciblity Time on the current instance.
 */
function HurtSysStep()
{
    if (invincibleBuffer <= 0)
        return;
    
    invincibleBuffer--;
}