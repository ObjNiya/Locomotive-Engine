global.colliders = [];

#macro MIN_COLLIDER_SIZE 32

enum PLATFORM_DIRECTIONS
{
    TOP = 1,
    RIGHT = 2,
    BOTTOM = 3,
    LEFT = 4,
}

enum COLLIDER_TAGS 
{
    HURT_PLAYER = 0,
    HUR_ENEMY = 1,
}

function Collider(copy_owner, left_side_x = 0, right_side_x = MIN_COLLIDER_SIZE, top_side_y = 0, bottom_side_y = MIN_COLLIDER_SIZE) constructor
{
    owner = other.id;
    num = array_length(global.colliders);
    self.copy_owner = copy_owner;
    active = true;
    can_touch_self = false;
    
    static set_size = function(left_side_x, right_side_x, top_side_y, bottom_side_y)
    {
        l = left_side_x;
        r = right_side_x;
        t = top_side_y;
        b = bottom_side_y;
    }
    
    static set_slope = function(is_slope, flipped_horizontally, flipped_vertically)
    {
        self.is_slope = is_slope;
        slope_flip_x = flipped_horizontally;
        slope_flip_y = flipped_vertically;
    }
    
    static set_platform = function(is_platform, platform_direction)
    {
        self.is_platform = is_platform;
        self.platform_dir = platform_direction;
    }
    
    static set_depth_range = function(range_minimum, range_maximum)
    {
        min_depth = range_minimum;
        max_depth = range_maximum;
    }
    
    static set_breakable = function(can_break, toughness)
    {
        breakable = can_break;
        breakable_tough = toughness;
    }
    
    static set_conveyor_speed = function(left_side_speed, right_side_speed, top_side_speed, bottom_side_speed)
    {
        l_spd = left_side_speed;
        r_spd = right_side_speed;
        t_spd = top_side_speed;
        b_spd = bottom_side_speed;
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
    
    static clear_tags = function()
    {
        tags = [];
    }
    
    static move = function(pixels_to_move_on_x, pixels_to_move_on_y)
    {
        l += pixels_to_move_on_x;
        r += pixels_to_move_on_x;
        t += pixels_to_move_on_y;
        b += pixels_to_move_on_y;
    }
    
    static begin_step = function()
    {
        l_prev = l;
        r_prev = r;
        t_prev = t;
        b_prev = b;
    }

    static step = function()
    {
        if (!copy_owner)
            return;
        if (!instance_exists(owner))
        {
            copy_owner = false;
            return;
        }
        
        set_size(owner.bbox_left, owner.bbox_right, owner.bbox_top, owner.bbox_bottom)
    }
    
    if (copy_owner)
    {
        solid = owner.solid;
        persists = owner.persistent;
        
        step();
    }
    else
    {
        solid = true;
        persists = false;
        
        set_size(left_side_x, right_side_x, top_side_y, bottom_side_y);
    }
    
    begin_step();
    set_depth_range(0, 1);
    set_slope(false, false, false);
    set_platform(false, PLATFORM_DIRECTIONS.TOP);
    set_breakable(false, 1);
    set_conveyor_speed(0, 0, 0, 0);
    clear_tags();
    
    array_push(global.colliders, self);
}

function collider_has_tag(collider, tag_to_check)
{
    return (array_get_index(collider.tags, tag_to_check) != -1);
}

function delete_collider(collider_to_delete)
{
    array_delete(global.colliders, collider_to_delete.num, 1);
    delete collider_to_delete;
}

function colliders_touching(collider_a, collider_b, collider_a_x_offset = 0, collider_a_y_offset = 0, collider_b_x_offset = 0, collider_b_y_offset = 0, collider_b_tag_filter = -1)
{
    if ((collider_a.owner == collider_b.owner && !collider_a.can_touch_self && !collider_b.can_touch_self) || 
        (collider_a.min_depth >= collider_b.max_depth || collider_a.max_depth <= collider_b.min_depth) ||
        (collider_b_tag_filter != -1 && !collider_has_tag(collider_b, collider_b_tag_filter)) ||
        !collider_b.active || !collider_b.solid) {
        return false;
    }
    
    var l_a = collider_a.l + collider_a_x_offset;
    var r_a = collider_a.r + collider_a_x_offset;
    var t_a = collider_a.t + collider_a_y_offset;
    var b_a = collider_a.b + collider_a_y_offset;
    
    var l_b = collider_b.l + collider_b_x_offset;
    var r_b = collider_b.r + collider_b_x_offset;
    var t_b = collider_b.t + collider_b_y_offset;
    var b_b = collider_b.b + collider_b_y_offset;
    
    if (collider_b.is_slope)
    {
		var offset_collider_a = variable_clone(collider_a)
			offset_collider_a.l = l_a 
			offset_collider_a.r = r_a
			offset_collider_a.t = t_a
			offset_collider_a.b = b_a
		var offset_collider_b = variable_clone(collider_b)
			offset_collider_b.l = l_b
			offset_collider_b.r = r_b
			offset_collider_b.t = t_b
			offset_collider_b.b = b_b
		
        var progress = slope_get_progress(offset_collider_a, offset_collider_b);
        
        if (!collider_b.slope_flip_y)
            t_b = floor(lerp(b_b, t_b, progress));
        else
            b_b = floor(lerp(t_b, b_b, progress));
    }

    return (l_a < r_b && r_a > l_b &&
        t_a < b_b && b_a > t_b);
}

function colliders_touching_precise(collider_a, collider_b, collider_a_x_offset = 0, collider_a_y_offset = 0, collider_b_tag_filter = -1)
{
    if (colliders_touching(collider_a, collider_b, collider_a_x_offset, collider_a_y_offset, 0, 0, collider_b_tag_filter))
        return false;
    if (!instance_exists(collider_a.owner) || !instance_exists(collider_b.owner))
        return false;
    
    larp (collider_a.owner)
        return place_meeting(x + collider_a_x_offset, y + collider_a_y_offset, collider_b.owner);
}