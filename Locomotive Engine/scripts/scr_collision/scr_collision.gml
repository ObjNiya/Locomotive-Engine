global.colliders = [];

enum COLLIDER_TAGS 
{
    HURTBOX = 0,
    HURTBOX_PLAYER = 1,
    HURTBOX_ENEMY = 2,
}

function Collider(left, top, bottom, right) constructor
{
    active = true;
    solid = true;
    persists = false;
    depth = 0;
    num = array_length(global.colliders);
    owner = other.id;
    tags = [];
    
    static set_dimensions = function(left, top, bottom, right)
    {
        self.left = left;
        self.top = top;
        self.bottom = bottom;
        self.right = right;
    }
    
    static add_dimensions = function(left, top, bottom, right)
    {
        set_dimensions(self.left + left, self.top + top, self.bottom + bottom, self.right + right);
    }
    
    static set_breakable = function(enabled, toughness)
    {
        is_breakable = enabled;
        breakable_toughness = toughness;
    }
    
    static set_slope = function(enabled, flip_x, flip_y)
    {
        is_slope = enabled;
        slope_flip_x = flip_x;
        slope_flip_y = flip_y;
    }
    
    static set_platform = function(enabled, dir)
    {
        is_platform = enabled;
        platform_dir = dir;
    }
    
    static set_conveyor = function(left, top, bottom, right)
    {
        left_spd = left;
        top_spd = top;
        bottom_spd = bottom;
        right_spd = right;
    }
    
    static add_tag = function(tag_to_add) 
    {
        array_push(tags, tag_to_add);
    }
   
    static remove_tag = function(tag_to_remove)
    {
        var tag_index = array_get_index(tags, tag_to_remove);
        
        if (tag_index != -1)
            array_delete(tags, tag_index, 1);
    }

    set_dimensions(left, top, bottom, right);        
    set_breakable(false, 0);
    set_slope(false, false, false);
    set_platform(false, 1);
    set_conveyor(0, 0, 0, 0);
    
    array_push(global.colliders, self);
}

function collider_check_tag(collider, tag_to_check)
{
    var i = 0;
    var tag_count = array_length(collider.tags);
    
    repeat (tag_count)
    {
        if (collider.tags[i] == collider)
            return true;
        
        i++;
    }
    
    return false;
}

enum COLLIDE_TYPES
{
    NONE = 0,
    WALL = 1,
    SLOPE = 2,
}

/*function colliders_touching(collider_a, collider_b, x_off_a = 0, y_off_a = 0, x_off_b = 0, y_off_b = 0)
{
    if (collider_a.owner == collider_b.owner || collider_a.depth != collider_b.depth || !collider_a.active || !collider_b.solid || !collider_b.active) 
        return false;
    
    var left_a = collider_a.left + x_off_a;
    var top_a = collider_a.top + y_off_a;
    var bottom_a = collider_a.bottom + y_off_a;
    var right_a = collider_a.right + x_off_a;
    
    var left_b = collider_b.left + x_off_b;
    var top_b = collider_b.top + y_off_b;
    var bottom_b = collider_b.bottom + y_off_b;
    var right_b = collider_b.right + x_off_a;
    
    var progress = slope_get_progress(collider_a, collider_b);
    
    if (progress != -1)
    {
        if (!collider_b.slope_flip_y)
            top_b = round(lerp(collider_b.bottom, collider_b.top, progress));
        else
            bottom_b = round(lerp(collider_b.top, collider_b.bottom, progress));
    }
    
    var aabb = (left_a < right_a &&
        collider_a.right > collider_ &&
        collider_a.top < bottom_b &&
        collider_a.bottom > top_b);
    
    if (!touch_any)
        return COLLIDE_TYPES.NONE;
    else
        return COLLIDE_TYPES.WALL;
}*/


function colliders_touching(collider_a, collider_b, x_offset_a = 0, y_offset_a = 0, x_offset_b = 0, y_offset_b = 0)
{
    if (collider_a.owner == collider_b.owner || collider_a.depth != collider_b.depth || !collider_b.solid || !collider_b.active) 
        return false;
    
    //collider_a.add_dimensions(x_offset_a, y_offset_a, y_offset_a, x_offset_a);
   // collider_b.add_dimensions(x_offset_b, y_offset_b, y_offset_b, x_offset_b);
    
    var top_b = collider_b.top;
    var bottom_b = collider_b.bottom;
    
    var progress = slope_get_progress(collider_a, collider_b);
    
    if (progress != -1)
    {
        if (!collider_b.slope_flip_y)
            top_b = round(lerp(collider_b.bottom, collider_b.top, progress));
        else
            bottom_b = round(lerp(collider_b.top, collider_b.bottom, progress));
    }

    var aabb = (collider_a.left < collider_b.right &&
        collider_a.right > collider_b.left &&
        collider_a.top < bottom_b &&
        collider_a.bottom > top_b);
    
    //collider_a.add_dimensions(-x_offset_a, -y_offset_a, -y_offset_a, -x_offset_a);
    //collider_b.add_dimensions(-x_offset_b, -y_offset_b, -y_offset_b, -x_offset_b);
    
    return aabb;
}

function check_collide_id(collider_to_check)
{
    var i = 0;
    var collider_count = array_length(global.colliders);
    
    repeat (collider_count)
    {
        var collider = global.colliders[i];
        
        if (colliders_touching(collider_to_check, collider))
            return collider;
        
        i++;
    }
    
    return -1;
}

function check_collide(collider_to_check)
{
    return (check_collide_id(collider_to_check) != -1);
}

function check_collide_array(collider_to_check)
{
    var i = 0;
    var touched_colliders = [];
    var collider_count = array_length(global.colliders);
    
    repeat (collider_count)
    {
        var collider = global.colliders[i];
        
        if (colliders_touching(collider_to_check, collider))
            array_push(touched_colliders, collider);
        
        i++;
    }
    
    return touched_colliders;
}

function delete_collider(collider_to_delete)
{
    array_delete(global.colliders, collider_to_delete.num, 1);
    delete collider_to_delete;
}