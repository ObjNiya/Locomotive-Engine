/// @ignore
function PartLayerData(lay) constructor 
{
    system = part_system_create_layer(lay, true);
    emitter = part_emitter_create(system);

    part_system_automatic_update(system, false);
}

/// @ignore
function PartRegisterConfig() constructor
{
    partType = -1;
    partTypeL = -1;
    partTypeR = -1;
    partTypeU = -1;
    partTypeD = -1;
    
    partPriority = PRIORITY.LOWEST;
    partXOrigin = 0;
    partYOrigin = 0;
}


/**
 * Sets the lifespan of the given particle type to the length of the given sprites animation. (In frames)
 * @parameter {Id.ParticleType} part_type The particle type to set the lifespan of.
 * @parameter {Asset.GMSprite} part_type_spr The sprite to get the animation length from and set the particle types lifespan to.
 */
function PartTypeAnimate(part_type, part_type_spr)
{
    var sprite_speed = sprite_get_speed(part_type_spr);
    if (sprite_get_speed_type(part_type_spr) == spritespeed_framespergameframe)
        sprite_speed *= FPS;
    var lifespan = (FPS / sprite_speed) * sprite_get_number(part_type_spr);
    
    part_type_life(part_type, lifespan, lifespan);
}


/**
 * Creates a particle type and configures it to use the given sprite and last until its animation has ended.
 * @parameter {Asset.GMSprite} part_type_spr The sprite to assign to the particle type.
 */
function PartTypeCreateGeneric(part_type_spr)
{
    var part_type = part_type_create();
    
    part_type_sprite(part_type, part_type_spr, true, true, false);
    PartTypeAnimate(part_type, part_type_spr);
   
    return part_type;
}


/**
 * Creates a particle type and configures it to use the given sprite, Give it a random frame offset, rotate its sprite randomly from 1 to 270 degrees, get a speed of 4 into a random direction from 14 to 166 degrees and fall downwards with gravity.
 * @parameter {Asset.GMSprite} part_type_spr The sprite to assign to the particle type.
 * @parameter {Bool} animated (OPTIONAL) Whether or not the particle type should be configured to animate. Default is false.
 * @parameter {Bool} ends_on_anim (OPTIONAL) Whether or not the particle type should only last until its animation has ended.
 */
function PartTypeCreateDebris(part_type_spr, animated = false, ends_on_anim = false)
{
    var part_type = part_type_create();
    
    part_type_sprite(part_type, part_type_spr, animated, false, true);
    part_type_speed(part_type, 3, 5, 0, 0);
    part_type_gravity(part_type, 0.4, 270);
    part_type_direction(part_type, 14, 166, 0, 0);
    part_type_orientation(part_type, 1, 270, 0, 0, false);
    
    if (ends_on_anim)
        PartTypeAnimate(part_type, part_type_spr);
    else
        part_type_life(part_type, 150, 150); // Should allow the debris enough time to get off screen before dissapearing
    
    return part_type;
}


/**
 * Registers the given particle type to the given `PART_TYPES` enum entry.
 * @parameter {Real} part_enum Which enum entry to assign the particle type to.
 * @parameter {Id.ParticleType} part_type Which particle type to register.
 * @parameter {Real} part_priority (OPTIONAL) The draw priority of the registered particle type from the `PRIORITY` enum. Default is lowest.
 * @parameter {Real} part_x_origin (OPTIONAL) How far to offset the registered particle type to the left when it's spawned. Default is 0.
 * @parameter {Real} part_y_origin (OPTIONAL) How far to offset the registered particle type upwards when it's spawned. Default is 0.
 */
function PartTypeRegister(part_enum, part_type, part_priority = PRIORITY.LOWEST, part_x_origin = 0, part_y_origin = 0)
{
    if (!ds_map_exists(global.partLayers, part_priority))
        global.partLayers[? part_priority] = new PartLayerData(PriorityGetLay(part_priority, false));
    
    var cfg = new PartRegisterConfig();
    
    with (cfg)
    {
        partType = part_type;
        partPriority = part_priority;
        partXOrigin = part_x_origin;
        partYOrigin = part_y_origin;
    }
    
    if (part_enum >= array_length(global.partTypes) || global.partTypes[part_enum] == 0)
    {
        global.partTypes[part_enum] = cfg;
        return;
    }
    else if (!is_array(global.partTypes[part_enum])) 
        global.partTypes[part_enum] = [global.partTypes[part_enum]];
    
    array_push(global.partTypes[part_enum], cfg);
}


/**
 * Assigns particle types to the given particle register to be spawned by `PartSpawnDirX()` or `PartSpawnExtDirX()`.
 * @parameter {Real} part_enum The enum entry of the particle register to assign the particle types to.
 * @parameter {Id.ParticleType} left_part_type Which particle type to register to the left direction.
 * @parameter {Id.ParticleType} right_part_type Which particle type to register to the right direction.
 */
function PartTypeRegisterDirX(part_enum, left_part_type, right_part_type)
{
    if (part_enum >= array_length(global.partTypes) || global.partTypes[part_enum] == 0)
        PartTypeRegister(part_enum, right_part_type, PRIORITY.LOWEST, 0, 0);
    
    var cfg = global.partTypes[part_enum];
    if (is_array(cfg))
    {
        var index = array_length(global.partTypes[part_enum]) - 1;
        cfg = global.partTypes[part_enum][index];
    }
    
    with (cfg) 
    {
        partTypeL = left_part_type;
        partTypeR = right_part_type;
    }
}


/**
 * Assigns particle types to the given particle register to be spawned by `PartSpawnDirY()` or `PartSpawnExtDirY()`.
 * @parameter {Real} part_enum The enum entry of the particle register to assign the particle types to.
 * @parameter {Id.ParticleType} down_part_type Which particle type to register to the down direction.
 * @parameter {Id.ParticleType} up_part_type Which particle type to register to the up direction.
 */
function PartTypeRegisterDirY(part_enum, down_part_type, up_part_type)
{
    if (part_enum >= array_length(global.partTypes) || global.partTypes[part_enum] == 0)
        PartTypeRegister(part_enum, down_part_type, PRIORITY.LOWEST, 0, 0);
    
    var cfg = global.partTypes[part_enum];
    if (is_array(cfg))
    {
        var index = array_length(global.partTypes[part_enum]) - 1;
        cfg = global.partTypes[part_enum][index];
    }
    
    with (cfg) 
    {
        partTypeD = down_part_type;
        partTypeU = up_part_type;
    }
}


/// @ignore
function __PartSpawn__(x, y, part_enum_or_cfg, part_dir, left_spread = 0, right_spread = 0, up_spread = 0, down_spread = 0, spread_shape = ps_shape_rectangle, spread_distr = ps_distr_linear, relative = false, amount = 1)
{
    amount = max(amount, 1);
    
    var part_cfg = (is_numeric(part_enum_or_cfg)) ? global.partTypes[part_enum_or_cfg] : part_enum_or_cfg;
    
    if (is_array(part_cfg))
    {
        var cfg_count = array_length(part_cfg);
        var i = 0;
        
        repeat (cfg_count)
        {
            __PartSpawn__(x, y, part_cfg[i], part_dir, left_spread, right_spread, up_spread, down_spread, spread_shape, spread_distr, relative, amount);
            i++;
        }
        
        return;
    }
    
    var part_type = part_cfg.partType;
    
    switch (part_dir)
    {
        case 1:
            part_type = part_cfg.partTypeL;
            break;
        case 2:
            part_type = part_cfg.partTypeR;
            break;
        case 3:
            part_type = part_cfg.partTypeD;
            break;
        case 4:
            part_type = part_cfg.partTypeU;
            break;
    }
    
    if (part_type == -1)
        return;
    
    var part_system = global.partLayers[? part_cfg.partPriority].system;
    var part_emitter = global.partLayers[? part_cfg.partPriority].emitter;

    var xmin = x - left_spread - part_cfg.partXOrigin;
    var xmax = x + right_spread - part_cfg.partYOrigin;
    
    var ymin = y - up_spread - part_cfg.partYOrigin;
    var ymax = y + down_spread - part_cfg.partYOrigin;
    
    part_emitter_relative(part_system, part_emitter, relative);
    part_emitter_region(part_system, part_emitter, xmin, xmax, ymin, ymax, spread_shape, spread_distr);
    part_emitter_burst(part_system, part_emitter, part_type, amount);
}


/**
 * Spawns the given particle type from the `PART_TYPES` enum.
 * @parameter {Real} x The x position to spawn the particle type at.
 * @parameter {Real} y The y position to spawn the particle type at.
 * @parameter {Real} part_enum Which particle type to spawn from the `PART_TYPES` enum.
 * @parameter {Real} horiz_spread (OPTIONAL) How far the random horizontal spawn offset can go. Default is 0.
 * @parameter {Real} vert_spread (OPTIONAL) How far the random vertical spawn offset can go. Default is 0.
 * @parameter {Constant.ParticleRegionShape} spread_shape (OPTIONAL) The shape of the random offset area defined by `horiz_spread` and `vert_spread`. Default is rectangular.
 * @parameter {Constant.ParticleDistribution} spread_distr (OPTIONAL) The random offset distribution style. Default is linear.
 * @parameter {Bool} relative (OPTIONAL) Whether or not the amount of particle types spawned is relative to the dimensions of the random offset area. Default is false.
 * @parameter {Real} amount (OPTIONAL) How many particles to spawn if relative is `false` or the particle spawn density of the random offset area with relative set to `true`. Default is 1.
 */
function PartSpawn(x, y, part_enum, horiz_spread = 0, vert_spread = 0, spread_shape = ps_shape_rectangle, spread_distr = ps_distr_linear, relative = false, amount = 1)
{
    __PartSpawn__(x, y, part_enum, 0, horiz_spread, horiz_spread, vert_spread, vert_spread, spread_shape, spread_distr, relative, amount);
}


/**
 * Spawns the given particle type from the `PART_TYPES` enum.
 * @parameter {Real} x The x position to spawn the particle type at.
 * @parameter {Real} y The y position to spawn the particle type at.
 * @parameter {Real} part_enum Which particle type to spawn from the `PART_TYPES` enum.
 * @parameter {Real} left_spread (OPTIONAL) How far the random horizontal offset can go to the left. Default is 0.
 * @parameter {Real} right_spread (OPTIONAL) How far the random horizontal offset can go to the right. Default is 0.
 * @parameter {Real} up_spread (OPTIONAL) How far the random vertical spawn offset can go upwards. Default is 0.
 * @parameter {Real} down_spread (OPTIONAL) How far the random vertical spawn offset can go downwards. Default is 0.
 * @parameter {Constant.ParticleRegionShape} spread_shape (OPTIONAL) The shape of the random offset area defined by `horiz_spread` and `vert_spread`. Default is rectangular.
 * @parameter {Constant.ParticleDistribution} spread_distr (OPTIONAL) The random offset distribution style. Default is linear.
 * @parameter {Bool} relative (OPTIONAL) Whether or not the amount of particle types spawned is relative to the dimensions of the random offset area. Default is false.
 * @parameter {Real} amount (OPTIONAL) How many particles to spawn if relative is `false` or the particle spawn density of the random offset area with relative set to `true`. Default is 1.
 */
function PartSpawnExt(x, y, part_enum, left_spread = 0, right_spread = 0, up_spread = 0, down_spread = 0, spread_shape = ps_shape_rectangle, spread_distr = ps_distr_linear, relative = false, amount = 1)
{
    __PartSpawn__(x, y, part_enum, 0, left_spread, right_spread, up_spread, down_spread, spread_shape, spread_distr, relative, amount);
}


/**
 * Spawns either the left or right particle type from the `PART_TYPES` enum based on the dir parameter.
 * @parameter {Real} x The x position to spawn the particle type at.
 * @parameter {Real} y The y position to spawn the particle type at.
 * @parameter {Real} part_enum Which particle type to spawn from the `PART_TYPES` enum.
 * @parameter {Real} dir Which directional particle type to spawn, -1 for the left particle type, anything else for the right particle type.
 * @parameter {Real} horiz_spread (OPTIONAL) How far the random horizontal spawn offset can go. Default is 0.
 * @parameter {Real} vert_spread (OPTIONAL) How far the random vertical spawn offset can go. Default is 0.
 * @parameter {Constant.ParticleRegionShape} spread_shape (OPTIONAL) The shape of the random offset area defined by `horiz_spread` and `vert_spread`. Default is rectangular.
 * @parameter {Constant.ParticleDistribution} spread_distr (OPTIONAL) The random offset distribution style. Default is linear.
 * @parameter {Bool} relative (OPTIONAL) Whether or not the amount of particle types spawned is relative to the dimensions of the random offset area. Default is false.
 * @parameter {Real} amount (OPTIONAL) How many particles to spawn if relative is `false` or the particle spawn density of the random offset area with relative set to `true`. Default is 1.
 */
function PartSpawnDirX(x, y, part_enum, dir, horiz_spread = 0, vert_spread = 0, spread_shape = ps_shape_rectangle, spread_distr = ps_distr_linear, relative = false, amount = 1)
{
    switch (dir)
    {
        case -1:
            dir = 1;
            break;
        case 1:
            dir = 2;
            break;
        default:
            dir = 0;
            break;
    }
    
    __PartSpawn__(x, y, part_enum, dir, horiz_spread, horiz_spread, vert_spread, vert_spread, spread_shape, spread_distr, relative, amount);
}

/**
 * Spawns either the left or right particle type from the `PART_TYPES` enum based on the dir parameter.
 * @parameter {Real} x The x position to spawn the particle type at.
 * @parameter {Real} y The y position to spawn the particle type at.
 * @parameter {Real} part_enum Which particle type to spawn from the `PART_TYPES` enum.
 * @parameter {Real} dir Which directional particle type to spawn, -1 for the left particle type, anything else for the right particle type.
 * @parameter {Real} part_enum Which particle type to spawn from the `PART_TYPES` enum.
 * @parameter {Real} left_spread (OPTIONAL) How far the random horizontal offset can go to the left. Default is 0.
 * @parameter {Real} right_spread (OPTIONAL) How far the random horizontal offset can go to the right. Default is 0.
 * @parameter {Real} up_spread (OPTIONAL) How far the random vertical spawn offset can go upwards. Default is 0.
 * @parameter {Real} down_spread (OPTIONAL) How far the random vertical spawn offset can go downwards. Default is 0.
 * @parameter {Constant.ParticleRegionShape} spread_shape (OPTIONAL) The shape of the random offset area defined by `horiz_spread` and `vert_spread`. Default is rectangular.
 * @parameter {Constant.ParticleDistribution} spread_distr (OPTIONAL) The random offset distribution style. Default is linear.
 * @parameter {Bool} relative (OPTIONAL) Whether or not the amount of particle types spawned is relative to the dimensions of the random offset area. Default is false.
 * @parameter {Real} amount (OPTIONAL) How many particles to spawn if relative is `false` or the particle spawn density of the random offset area with relative set to `true`. Default is 1.
 */
function PartSpawnExtDirX(x, y, part_enum, dir, left_spread = 0, right_spread = 0, up_spread = 0, down_spread = 0, spread_shape = ps_shape_rectangle, spread_distr = ps_distr_linear, relative = false, amount = 1)
{
    switch (dir)
    {
        case -1:
            dir = 1;
            break;
        case 1:
            dir = 2;
            break;
        default:
            dir = 0;
            break;
    }
    
    __PartSpawn__(x, y, part_enum, dir, left_spread, right_spread, up_spread, down_spread, spread_shape, spread_distr, relative, amount);
}


/**
 * Spawns either the down or up particle type from the `PART_TYPES` enum based on the dir parameter.
 * @parameter {Real} x The x position to spawn the particle type at.
 * @parameter {Real} y The y position to spawn the particle type at.
 * @parameter {Real} part_enum Which particle type to spawn from the `PART_TYPES` enum.
 * @parameter {Real} dir Which directional particle type to spawn, -1 for the up particle type, anything else for the down particle type.
 * @parameter {Real} horiz_spread (OPTIONAL) How far the random horizontal spawn offset can go. Default is 0.
 * @parameter {Real} vert_spread (OPTIONAL) How far the random vertical spawn offset can go. Default is 0.
 * @parameter {Constant.ParticleRegionShape} spread_shape (OPTIONAL) The shape of the random offset area defined by `horiz_spread` and `vert_spread`. Default is rectangular.
 * @parameter {Constant.ParticleDistribution} spread_distr (OPTIONAL) The random offset distribution style. Default is linear.
 * @parameter {Bool} relative (OPTIONAL) Whether or not the amount of particle types spawned is relative to the dimensions of the random offset area. Default is false.
 * @parameter {Real} amount (OPTIONAL) How many particles to spawn if relative is `false` or the particle spawn density of the random offset area with relative set to `true`. Default is 1.
 */
function PartSpawnDirY(x, y, part_enum, dir, horiz_spread = 0, vert_spread = 0, spread_shape = ps_shape_rectangle, spread_distr = ps_distr_linear, relative = false, amount = 1)
{
    switch (dir)
    {
        case -1:
            dir = 4;
            break;
        case 1:
            dir = 3;
            break;
        default:
            dir = 0;
            break;
    }
    
    __PartSpawn__(x, y, part_enum, dir, horiz_spread, horiz_spread, vert_spread, vert_spread, spread_shape, spread_distr, relative, amount);
}


/**
 * Spawns either the down or up particle type from the `PART_TYPES` enum based on the dir parameter.
 * @parameter {Real} x The x position to spawn the particle type at.
 * @parameter {Real} y The y position to spawn the particle type at.
 * @parameter {Real} part_enum Which particle type to spawn from the `PART_TYPES` enum.
 * @parameter {Real} dir Which directional particle type to spawn, -1 for the up particle type, anything else for the down particle type.
 * @parameter {Real} left_spread (OPTIONAL) How far the random horizontal offset can go to the left. Default is 0.
 * @parameter {Real} right_spread (OPTIONAL) How far the random horizontal offset can go to the right. Default is 0.
 * @parameter {Real} up_spread (OPTIONAL) How far the random vertical spawn offset can go upwards. Default is 0.
 * @parameter {Real} down_spread (OPTIONAL) How far the random vertical spawn offset can go downwards. Default is 0.
 * @parameter {Constant.ParticleRegionShape} spread_shape (OPTIONAL) The shape of the random offset area defined by `horiz_spread` and `vert_spread`. Default is rectangular.
 * @parameter {Constant.ParticleDistribution} spread_distr (OPTIONAL) The random offset distribution style. Default is linear.
 * @parameter {Bool} relative (OPTIONAL) Whether or not the amount of particle types spawned is relative to the dimensions of the random offset area. Default is false.
 * @parameter {Real} amount (OPTIONAL) How many particles to spawn if relative is `false` or the particle spawn density of the random offset area with relative set to `true`. Default is 1.
 */
function PartSpawnExtDirY(x, y, part_enum, dir, left_spread = 0, right_spread = 0, up_spread = 0, down_spread = 0, spread_shape = ps_shape_rectangle, spread_distr = ps_distr_linear, relative = false, amount = 1)
{
    switch (dir)
    {
        case -1:
            dir = 4;
            break;
        case 1:
            dir = 3;
            break;
        default:
            dir = 0;
            break;
    }
    
    __PartSpawn__(x, y, part_enum, dir, left_spread, right_spread, up_spread, down_spread, spread_shape, spread_distr, relative, amount);
}