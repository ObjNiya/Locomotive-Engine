enum DEPTHS
{
    BACK = 80,
    
    LOWEST = 60,
    LOWER = 40,
    LOW = 20,
    
    MID = 0,
    
    HIGH = -20,
    HIGHER = -40,
    HIGHEST = -60,
    
    FRONT = -80,
}

global.baseDepth = 0;
global.__objPriorities__ = ds_map_create();

function ObjSetDepth(obj_asset, target_depth)
{
    if (is_array(obj_asset))
    {
        var obj_count = array_length(obj_asset);
        var i = 0;
        
        repeat (obj_count)
        {
            ObjSetDepth(obj_asset[i], target_depth);
            i++;
        }
        
        return;
    }
    
    global.__objPriorities__[? obj_asset] = target_depth;
}

function ObjGetDepth(obj_asset)
{
    return global.__objPriorities__[? obj_asset];
}

function DepthSet(target_depth)
{
    if (layer_exists(layer))
    {
        depth = layer_get_depth(layer) + target_depth;
        return;
    }
    
    depth = global.baseDepth + target_depth;
}

#region World

// Back

ObjSetDepth([
    obj_solid,
    obj_ghostcollectable,
    par_points,
    par_room_switcher,
    par_afterimage,
    obj_doorkey,
    obj_outlet,
    obj_spring,
    obj_amiibox,
    obj_treasurecatripi,
    obj_secretegg,
    obj_secretegg_spawn,
    obj_exit_pointer,
    obj_patrick_pillar,
    obj_patrickblock,
    obj_cutoff
], DEPTHS.BACK);

// Lowest

ObjSetDepth([
    obj_block,
    obj_beatbox,
    par_particle,
    obj_speedlines_effect,
    par_debris,
    obj_levelpainting,
    obj_exitportal
], DEPTHS.LOWEST);

// Lower

ObjSetDepth(obj_taunt_particle, DEPTHS.LOWER);

// Low

ObjSetDepth([
    obj_followplayersprite,
    obj_treasurecatripi,
    obj_charge_effect
], DEPTHS.LOW);

// Medium

ObjSetDepth(par_enemy, DEPTHS.MID);

// High

ObjSetDepth([
    obj_player,
    obj_dead_enemy,
    obj_charge_effect,
    obj_groundpound_effect,
    obj_woosh_particle,
    obj_puff_particle,
    obj_block_debris,
    obj_points_number
], DEPTHS.HIGH);
ObjSetDepth(obj_player, DEPTHS.HIGH);

// Front

ObjSetDepth(obj_warppipe, DEPTHS.FRONT);

#endregion


#region HUD

// Back

ObjSetDepth([
    obj_hud_book,
    obj_hud_tv
], DEPTHS.BACK);

// Lowest

ObjSetDepth(obj_its_showtime, DEPTHS.LOWEST);

// Lower

ObjSetDepth(obj_hud_timer, DEPTHS.LOWER);

// Low

ObjSetDepth([par_cutscene, obj_titlecard], DEPTHS.LOW);

// Front

ObjSetDepth(par_roomtransition, DEPTHS.FRONT);
ObjSetDepth(obj_shell, DEPTHS.FRONT);

#endregion


