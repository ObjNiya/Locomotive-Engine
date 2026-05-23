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
        var touch_slope_side = check_collide_find_slope(check_collide_array(collider, sub_hsp, 1))
        var touch_slope_below = check_collide_find_slope(check_collide_array(collider, 0, 1))
		var sign_hsp = sign(sub_hsp);
		
        if touch_coll == -1 //go foward automatically if theres nothing infront
        {
            collider.move(sub_hsp, 0);
			
            x += sub_hsp;
			
			if touch_slope_below != -1 //go down slopes
			{	
				var prev_y = y;
				
				var progress = slope_get_progress(collider, touch_slope_below);
			
				bottom = ceil(lerp(touch_slope_below.b, touch_slope_below.t, progress));
				y = bottom - (bbox_bottom - y);
			
				collider.move(0, y - prev_y);
			}
            
            continue;
        }
		else if touch_slope_side != -1 //go up slopes
		{
			var behind_solid_side = !touch_slope_side.slope_flip_x ? bbox_right <= touch_slope_side.r : bbox_left >= touch_slope_side.l
			var above_corner = !touch_slope_side.slope_flip_y ? bbox_bottom <= touch_slope_side.b : bbox_top >= touch_slope_side.t
			
			if behind_solid_side && above_corner
			{
	            collider.move(sub_hsp, 0);
				
				var prev_y = y;
				
				var progress = slope_get_progress(collider, touch_slope_side);
				
				if !touch_slope_side.slope_flip_y
				{
				    var bottom = floor(lerp(touch_slope_side.b, touch_slope_side.t, progress));
					y = bottom - (bbox_bottom - y);
				}
				else
				{
				    var top = floor(lerp(touch_slope_side.t, touch_slope_side.b, progress));
					y = top + (y - bbox_top);
				}
				
				collider.move(0, y - prev_y);
				
				if check_collide_id(collider, 0, -1) == -1
				{
					x += sub_hsp
					continue;
				}
			}
		}
		
		var left = touch_coll.l;
        var right = touch_coll.r;
		
		if touch_coll.is_slope
        {
            var progress = slope_get_progress(collider, touch_coll);
            
            if !touch_coll.slope_flip_x
				left = floor(lerp(touch_coll.l, touch_coll.r, progress));
            else
				right = floor(lerp(touch_coll.r, touch_coll.l, progress));
        }
		
        if (sign_hsp == 1 && collider.l + sub_hsp != left)
            x = left - (x - bbox_left);
        else if (sign_hsp == -1 && collider.r + sub_hsp != right)
            x = right + (bbox_right - x);
		
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
        var bottom = touch_coll.b - 2; //for no particular reason at all the player is 2 pixels below a solid when clipping
		
		if (touch_coll.is_slope)
        {
            var progress = slope_get_progress(collider, touch_coll);
            
            if !touch_coll.slope_flip_y
				top = floor(lerp(touch_coll.b, touch_coll.t, progress));
            else
				bottom = floor(lerp(touch_coll.t, touch_coll.b, progress)) - 2;
        }
        
        if (sign_vsp == 1 && collider.t + sub_vsp != top)
            y = top - (bbox_bottom - y);
        else if (sign_vsp == -1 && collider.b + sub_vsp != bottom)
            y = bottom + (bbox_top - y);
		
        vsp = 0;
        vsp_frac = 0;
    }
    
    var sign_grav = sign(grav);
    var touch_coll = check_collide_id(collider, 0, sign_grav);

    grounded = touch_coll != -1;
    grounded_slope = grounded && check_collide_find_slope(check_collide_array(collider, 0, sign_grav)) != -1;
    
    if (!grounded)
        vsp += grav;
    
    collider.set_size(bbox_left, bbox_right, bbox_top, bbox_bottom);
}