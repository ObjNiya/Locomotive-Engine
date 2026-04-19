#macro MIN_COLLIDER_SIZE 32

#macro MIN_COLLIDER_HEIGHT 32
#macro MIN_COLLIDER_WIDTH 32

function physics_init()
{
    hsp = 0;
    vsp = 0;
    
    hsp_frac = 0;
    vsp_frac = 0;
    
    grav = -0.5;
    grav_horiz = 0;
    
    max_vsp = 20;
    max_hsp = infinity;
    
    grounded = false;
    grounded_slope = false;
    
    collider = new Collider(bbox_left, bbox_top, bbox_bottom, bbox_right);
    collider.persists = persistent;
    collider.solid = solid;
}

function physics_step()
{
	hsp += hsp_frac;
    vsp += vsp_frac;
    
    hsp_frac = hsp - ((floor(abs(hsp))) * sign(hsp));
    vsp_frac = vsp - ((floor(abs(vsp))) * sign(vsp));
    
    hsp -= hsp_frac;
    vsp -= vsp_frac;
    
    var hsp_steps = ceil(abs(hsp) / MIN_COLLIDER_WIDTH);
    var sub_hsp = hsp / hsp_steps;
    
    repeat (hsp_steps)
    {
        var next_coll = new Collider(collider.left + sub_hsp, collider.top, collider.bottom, collider.right + sub_hsp);
        var touch_coll = check_collide_id(collider);
        
        if (touch_coll == -1)
        {
            x += sub_hsp;
            collider.left += sub_hsp;
            collider.right += sub_hsp;
            
            delete_collider(next_coll);
            continue;
        } 
        
        var sign_hsp = sign(sub_hsp);
        var x_offset = x - bbox_left;
        
        if (true)
        {
            if (sign_hsp == 1 && next_coll.left != touch_coll.left)
                x = touch_coll.left - x_offset;
            else if (sign_hsp == -1 && next_coll.right != touch_coll.right)
                x = touch_coll.right + x_offset;
            
            hsp = 0;
            hsp_frac = 0;
        }
        
        delete_collider(next_coll);
    }
    
    var vsp_steps = ceil(abs(vsp) / MIN_COLLIDER_HEIGHT);
    var sub_vsp = vsp / vsp_steps;

    repeat (vsp_steps)
    {
        var next_coll = new Collider(collider.left, collider.top + sub_vsp, collider.bottom + sub_vsp, collider.right);
        var touch_coll = check_collide_id(next_coll);
        
        if (touch_coll == -1)
        {
            y += sub_vsp;
            collider.top += sub_vsp;
            collider.bottom += sub_vsp;
            
            delete_collider(next_coll);
            continue;
        }
        
        var sign_vsp = sign(sub_vsp);
        var progress = slope_get_progress(next_coll, touch_coll);
    
        var top = touch_coll.top;
        var bottom = touch_coll.bottom;
        
        if (progress != -1)
        {
            if (!touch_coll.slope_flip_y)
                top = lerp(touch_coll.bottom, touch_coll.top, progress);
            else
                bottom = lerp(touch_coll.top, touch_coll.bottom, progress);
        }
        
        if (sign_vsp == 1 && next_coll.top != top)
        {
            var y_offset = bbox_bottom - y;
            y = top - y_offset;
        }
        else if (sign_vsp == -1 && next_coll.bottom != bottom)
        {
            var y_offset = bbox_top - y;
            y = bottom + y_offset;
        }
        
        delete_collider(next_coll);
        vsp = 0;
        vsp_frac = 0;
    }
    
    var sign_grav = sign(grav);
    var adjacent_coll = new Collider(collider.left, collider.top + sign_grav, collider.bottom + sign_grav, collider.right);
    var touch_coll = check_collide_id(adjacent_coll);
        
    delete_collider(adjacent_coll);
    
    grounded = touch_coll != -1;
    grounded_slope = grounded && touch_coll.is_slope;
    
    if (!grounded)
        vsp += grav;
}