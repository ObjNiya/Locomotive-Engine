enum GRAV_DIR
{
    DOWN = 90,
    UP = 270,
    RIGHT = 0,
    LEFT = 180,
}

#macro DEFAULT_GRAV_FORCE 0.5
#macro DEFAULT_GRAV_DIR GRAV_DIR.DOWN

function CollisionCalcBboxSize()
{
    bboxWidth = bbox_right - bbox_left;
    bboxHeight = bbox_bottom - bbox_top;
}

function CollisionsCalcBboxMid()
{
    bboxCenter = bbox_left + (bboxWidth / 2);
    bboxMiddle = bbox_top + (bboxHeight / 2);
}

function CollisionInit()
{
    oldMaskIndex = mask_index;
    
    hsp = 0;
    vsp = 0;
    grav = DEFAULT_GRAV_FORCE;
    gravDir = DEFAULT_GRAV_DIR;
    physEnabled = true;
    
    hspFrac = 0;
    vspFrac = 0;
    hspCarry = 0;
    vspCarry = 0;
       
    CollisionCalcBboxSize();
    CollisionsCalcBboxMid();
}


function CollisionStep()
{
    if (oldMaskIndex != mask_index)
    {
        CollisionCalcBboxSize();
        CollisionsCalcBboxMid();
    }
    
    var size = max(bboxWidth, bboxHeight);
    var spd = max(hsp, vsp);
    var i = ceil(spd / size);
    
    var hsp_step = hsp / i;
    var vsp_step = vsp / i;
    
    repeat (i)
    {
        var next_solid = SolidMeeting(x + hsp_step, y + vsp_step);
        if (!instance_exists(next_solid))
        {
            x += hsp_step;
            y += vsp_step;
            continue;
        }
        
        var collide_side = SolidCollideGetSide(next_solid);
        switch (collide_side)
        {
            case CL_SIDES.LEFT:
                var bbox_r_offset = bbox_right - x;
                x = next_solid.bbox_left - bbox_r_offset;
                break;
            case CL_SIDES.RIGHT:
                var bbox_l_offset = bbox_left - x;
                x = next_solid.bbox_right - bbox_l_offset;
                break;
            case CL_SIDES.TOP:
                var bbox_t_offset = bbox_top - y;
                y = next_solid.bbox_top - bbox_t_offset;
                break;
            case CL_SIDES.BOTTOM:
                var bbox_b_offset = bbox_bottom - y;
                y = next_solid.bbox_bottom - bbox_b_offset;
                break;
        }
    }
    
    grounded = SolidMeeting(x, y + 1);
    if (!grounded)
        vsp += grav;
    
}