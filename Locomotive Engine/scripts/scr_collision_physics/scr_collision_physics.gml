function physics_init()
{
    hsp = 0;
    vsp = 0;
    
    hsp_frac = 0;
    vsp_frac = 0;
    
    grav = 0.5;
    grav_horiz = 0;
    
    max_vsp = 20;
    max_hsp = infinity;
    
    grounded = false;
    grounded_slope = false;
    
    collider = new Collider(false, bbox_left, bbox_right, bbox_top, bbox_bottom);
}

function physics_step()
{
	hsp += hsp_frac;
    vsp += vsp_frac;
    
    hsp_frac = hsp - ((floor(abs(hsp))) * sign(hsp));
    vsp_frac = vsp - ((floor(abs(vsp))) * sign(vsp));
    
    hsp -= hsp_frac;
    vsp -= vsp_frac;
    
    var hsp_steps = ceil(abs(hsp) / MIN_COLLIDER_SIZE);
    var sub_hsp = hsp / hsp_steps;
    
    repeat (hsp_steps)
    {
        var touch_coll = check_collide_id(collider, sub_hsp);
        
        if (touch_coll == -1)
        {
            x += sub_hsp;
            collider.move(sub_hsp, 0);
            
            continue;
        } 
        
        var sign_hsp = sign(sub_hsp);

        if (sign_hsp == 1 && collider.l + sub_hsp != touch_coll.l)
            x = touch_coll.l - (x - bbox_left);
        else if (sign_hsp == -1 && collider.r + sub_hsp != touch_coll.r)
            x = touch_coll.r + (bbox_right - x);
        
        hsp = 0;
        hsp_frac = 0;
    }
    
    var vsp_steps = ceil(abs(vsp) / MIN_COLLIDER_SIZE);
    var sub_vsp = vsp / vsp_steps;

    repeat (vsp_steps)
    {
        var touch_coll = check_collide_id(collider, 0, sub_vsp);
        
        if (touch_coll == -1)
        {
            y += sub_vsp;
            collider.move(0, sub_vsp);
            
            continue;
        }
        
        var sign_vsp = sign(sub_vsp);
        
        var top = touch_coll.t;
        var bottom = touch_coll.b;
        
        if (touch_coll.is_slope)
        {
            var progress = slope_get_progress(collider, touch_coll);
            
            if (!touch_coll.slope_flip_y)
                top = floor(lerp(touch_coll.b, touch_coll.t, progress));
            else
                bottom = floor(lerp(touch_coll.t, touch_coll.b, progress));
        }
        
        if (sign_vsp == 1 && collider.t + sub_vsp != top)
            y = top - (bbox_bottom - y);
        else if (sign_vsp == -1 && collider.b + sign_vsp != bottom)
            y = bottom + (bbox_top - y);
        
        vsp = 0;
        vsp_frac = 0;
    }
    
    var sign_grav = sign(grav);
    var touch_coll = check_collide_id(collider, 0, sign_grav);

    grounded = touch_coll != -1;
    grounded_slope = grounded && touch_coll.is_slope;
    
    if (!grounded)
        vsp += grav;
    
    collider.set_size(bbox_left, bbox_right, bbox_top, bbox_bottom);
}