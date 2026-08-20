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

#macro DEFAULT_DEPTH DEPTHS.MID // What the default depth is for objects that don't have a depth set
#macro LAYER_DEPTH_BASE "Instances_1" // Which layer to get the depth from to use as the base depth

global.baseDepth = 0;
global.__objDepths__ = ds_map_create();


/**
 * Returns if a default depth value has been defined for the given object asset.
 * @parameter {Asset.GMObject} obj_asset Which object asset to check for.
 * @pure
 */
function ObjDepthExists(obj_asset)
{
    return ds_map_exists(global.__objDepths__, obj_asset);
}


/**
 * Sets the default depth value for the given object asset(s).
 * @parameter {Asset.GMObject|Array<Asset.GMObject>} obj_asset Which object asset  **OR** an array of object assets to set the depth for.
 * @parameter {Real} target_depth Which depth to assign from the ```DEPTHS``` enum.
 */
function ObjDepthSet(obj_asset, target_depth)
{
    if (is_array(obj_asset))
    {
        var obj_count = array_length(obj_asset);
        var i = 0;
        
        repeat (obj_count)
        {
            ObjDepthSet(obj_asset[i], target_depth);
            i++;
        }
        
        return;
    }

    global.__objDepths__[? obj_asset] = target_depth;
}


/**
 * Returns the default depth for the given object asset. If it has none set, it will search trough all it's parents to find one.
 * @parameter {Asset.GMObject} obj_asset The object asset to get the depth of.
 */
function ObjDepthGet(obj_asset)
{
    while (!ObjDepthExists(obj_asset) && obj_asset != -100)
        obj_asset = object_get_parent(obj_asset);
    
    if (obj_asset == -1 || !ObjDepthExists(obj_asset))
        return DEFAULT_DEPTH;
    
    return global.__objDepths__[? obj_asset];
}


/**
 * Sets the depth for the current instance to given one.
 * @parameter {Real} target_depth (OPTIONAL) Which depth to assign from the ```DEPTHS``` enum. Uses the default object depth is -1 is given.
 */
function DepthSet(target_depth = -1)
{
    if (target_depth == -1)
        target_depth = ObjDepthGet(object_index);
    
    depth = global.baseDepth + target_depth;
}

#region World

// Back

ObjDepthSet([
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

ObjDepthSet([
    obj_block,
    obj_beatbox,
    par_particle,
    obj_speedlines_effect,
    par_debris,
    obj_levelpainting,
    obj_exitportal
], DEPTHS.LOWEST);

// Lower

ObjDepthSet(obj_taunt_particle, DEPTHS.LOWER);

// Low

ObjDepthSet([
    obj_followplayersprite,
    obj_treasurecatripi,
    obj_charge_effect
], DEPTHS.LOW);

// Medium

ObjDepthSet(par_enemy, DEPTHS.MID);

// High

ObjDepthSet([
    obj_player,
    obj_dead_enemy,
    obj_charge_effect,
    obj_groundpound_effect,
    obj_woosh_particle,
    obj_puff_particle,
    obj_block_debris,
    obj_points_number
], DEPTHS.HIGH);
ObjDepthSet(obj_player, DEPTHS.HIGH);

// Front

ObjDepthSet(obj_warppipe, DEPTHS.FRONT);

#endregion


#region HUD

// Back

ObjDepthSet([par_cutscene, obj_titlecard], DEPTHS.BACK);

// Lowest

ObjDepthSet(par_roomtransition, DEPTHS.LOWEST);

// Lower

ObjDepthSet([
    obj_hud_book,
    obj_hud_tv
], DEPTHS.LOWER);

// Low

ObjDepthSet(obj_its_showtime, DEPTHS.LOW);

// Middle

ObjDepthSet(obj_hud_timer, DEPTHS.MID);

// Highest

ObjDepthSet([obj_techdifficulties_out, obj_loadingscreen], DEPTHS.HIGHEST);

// Front

ObjDepthSet(obj_shell, DEPTHS.FRONT);

#endregion


