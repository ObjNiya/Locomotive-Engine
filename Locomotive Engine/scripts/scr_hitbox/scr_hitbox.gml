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

function HitboxPlace(self_hitbox, obj, obj_hitbox_name, return_owner = true)
{
    with (self_hitbox)
    { 
        if (!canAttack)
            return noone;
        
        image_xscale = owner.image_xscale;
        image_yscale = owner.image_yscale;
        image_angle = owner.image_angle;
    }

    with (obj)
    {
        var hitbox = variable_instance_get(id, obj_hitbox_name);
        
        with (hitbox)
        {
            if (!canHurt)
                continue;
            
            self.x = owner.x;
            self.y = owner.y;
        
            image_xscale = owner.image_xscale;
            image_yscale = owner.image_yscale;
            image_angle = owner.image_angle;
        }

        with (self_hitbox)
        {
            var ins = instance_place(owner.x, owner.y, hitbox);
   
            if (ins == noone) 
                continue;
            if (return_owner)
                ins = ins.owner;
            
            return ins;
        }
    }
    
    return noone;
}

function HitboxMeeting(x, y, self_hitbox, other_hitbox)
{
    with (other_hitbox)
    {
        if (!canHurt)
            return false;
        
        self.x = owner.x;
        self.y = owner.y;
        
        image_xscale = owner.image_xscale;
        image_yscale = owner.image_yscale;
        image_angle = owner.image_angle;
    }
    
    with (self_hitbox)
    {
        image_xscale = owner.image_xscale;
        image_yscale = owner.image_yscale;
        image_angle = owner.image_angle;
        
        if (!canAttack)
            return false;
        
        return place_meeting(x, y, other_hitbox);
    }
}

