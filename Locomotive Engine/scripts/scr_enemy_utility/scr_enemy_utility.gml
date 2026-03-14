/**
 * This function will scare every enemy if your instance is within a range of 400 pixels ahead of the enemy, 130 pixels above the enemy to 90 pixels 
 * below the enemy and if there is no wall interscepting a straight path to from your instance to the enemy.
 * @parameter {Bool} forced Whether to the ignore the range check and the wall interscept check and just scare the enemy anyway.
 * @returns {Bool}
 */
function scare_enemy(forced = false)
{
    with (par_enemy)
    {
        var in_sight = (collision_rectangle(x - (400 * (image_xscale == -1)), y - 130, x + (400 * (image_xscale == 1)), y + 90, other, false, false));
        var wall_intersects = (collision_line(x, y, other.x, other.y, obj_solid, false, true) != noone);
        
        if ((!in_sight || wall_intersects) && !forced)
            return false;
        
        if (x != other.x)
            image_xscale = -sign(x - other.x);
        
        if (state_id != state_enemy_scared)
            smc_set_state(state_enemy_scared);
        
        scared_timer.start();
        
        return true;
    }
}

function stun_enemy()
{
    with (par_enemy)
    {
        if (!place_meeting(x, y, other))
            return false;
        
        if (other.x > x)
            image_xscale = -1;
        else
            image_xscale = 1;
        
        movespeed = 15;
        smc_set_state(state_enemy_stunned);
        
        return true;
    }
}

function hurt_enemy()
{
    with (par_enemy)
    {
        if (!place_meeting(x, y, other))
        {
            //trace("NOT MEETING")
            return false;
        }
        
        //trace("MEETING")
        if (hp-- <= 0)
        {
            instance_destroy();
            return true;
        }
        
        return stun_enemy();
    }
}