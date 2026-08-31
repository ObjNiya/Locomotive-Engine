enum PART_TYPES
{
    // Particles
    
    BANG = 0,
    BIGEXPLO = 1,
    BIGPUFF = 2,
    BLOCKDUST = 3,
    BUMPSPARK = 4,
    CLOUD = 5,
    STEP_CLOUD = 6,
    AIR_CLOUD = 7,
    DASHCLOUD = 8,
    DASHCLOUD_ALT = 9,
    EXPLO = 10,
    FLAME = 11,
    GRABDASHCLOUD = 12,
    GRNDPNDIMPACT = 13,
    HURTSTARS = 14,
    JUMPCLOUD  = 15,
    KEYSHINE = 16,
    LANDCLOUD = 17,
    MACH3CLOUD = 18,
    MACH4CLOUDS = 19,
    NOTES = 20,
    PARRYSPARK = 21,
    PUFF = 22,
    RING = 23,
    SIDE_PUFF = 24,
    SPARK = 25,
    STARTCLOUD = 26,
    STOMPSTARS = 27,
    WATERSPLASH = 28,
    
    // Debris
    
    BLOCK_DEBRIS = 29,
    DEBRIS = 30,
    ENEMY_DEBRIS = 31,
    LEVEL_DEBRIS = 32,
    METALBLOCK_DEBRIS = 33,
    SLAPSTARS_DEBRIS = 34,
    WATERDROP_DEBRIS = 35,
    HURTSTARS_DEBRIS = 36,
}

global.partLayers = ds_map_create();
global.partTypes = [];

// Generic Particles

PartTypeRegister(PART_TYPES.BANG, PartTypeCreateGeneric(spr_bang_part));
PartTypeRegister(PART_TYPES.BIGEXPLO, PartTypeCreateGeneric(spr_bigexplosion_part));
PartTypeRegister(PART_TYPES.BIGPUFF, PartTypeCreateGeneric(spr_bigpuff_part));

// Block Dust Particle

var part_type = PartTypeCreateGeneric(spr_blockdust_part);
part_type_size(part_type, 0.55, 1.2, 0, 0);
PartTypeRegister(PART_TYPES.BLOCKDUST, part_type);

// More Generic Particles

PartTypeRegister(PART_TYPES.BUMPSPARK, PartTypeCreateGeneric(spr_bumpspark_part));
PartTypeRegister(PART_TYPES.CLOUD, PartTypeCreateGeneric(spr_cloud_part));

// Step Cloud Particle

part_type = PartTypeCreateGeneric(spr_cloud_part);
part_type_speed(part_type, 0.15, 0.35, 0, 0);
part_type_direction(part_type, 90, 90, 0, 0);
PartTypeRegister(PART_TYPES.STEP_CLOUD, part_type);

// Air Cloud Particle

part_type = PartTypeCreateGeneric(spr_cloud_part);
part_type_size(part_type, 0.8, 1.2, 0, 0);
PartTypeRegister(PART_TYPES.AIR_CLOUD, part_type);

// Dashcloud Particle

var r_part_type = PartTypeCreateGeneric(spr_dashcloud_part);
var l_part_type = PartTypeCreateGeneric(spr_dashcloud_part);

part_type_scale(l_part_type, -1, 1);
PartTypeRegisterDirX(PART_TYPES.DASHCLOUD, l_part_type, r_part_type);

// Dashcloud Alt Particle

r_part_type = PartTypeCreateGeneric(spr_dashcloud_part_alt);
l_part_type = PartTypeCreateGeneric(spr_dashcloud_part_alt);

part_type_scale(l_part_type, -1, 1);
PartTypeRegisterDirX(PART_TYPES.DASHCLOUD_ALT, l_part_type, r_part_type);

// Another Generic Particle

PartTypeRegister(PART_TYPES.EXPLO, PartTypeCreateGeneric(spr_explosion_part));

// Flame Particle

part_type = PartTypeCreateGeneric(spr_flame_part);
part_type_size(part_type, 1, 1, 0, 0.05);
PartTypeRegister(PART_TYPES.FLAME, part_type);

// Grabdash Cloud Particle

r_part_type = PartTypeCreateGeneric(spr_grabdashcloud_part);
l_part_type = PartTypeCreateGeneric(spr_grabdashcloud_part);

part_type_scale(l_part_type, -1, 1);
PartTypeRegisterDirX(PART_TYPES.GRABDASHCLOUD, l_part_type, r_part_type);

// More Generic Particles

PartTypeRegister(PART_TYPES.GRNDPNDIMPACT, PartTypeCreateGeneric(spr_grndpndimpact_part));
PartTypeRegister(PART_TYPES.HURTSTARS, PartTypeCreateGeneric(spr_hurtstars_part));
PartTypeRegister(PART_TYPES.JUMPCLOUD, PartTypeCreateGeneric(spr_jumpcloud_part));

// Key Shine Particle

part_type = PartTypeCreateGeneric(spr_keyshine_part);
part_type_blend(part_type, true);
PartTypeRegister(PART_TYPES.KEYSHINE, part_type);

// Another Generic Particle

PartTypeRegister(PART_TYPES.PARRYSPARK, PartTypeCreateGeneric(spr_parryspark_part));
PartTypeRegister(PART_TYPES.LANDCLOUD, PartTypeCreateGeneric(spr_landcloud_part));

// Mach Cloud Particles

r_part_type = PartTypeCreateGeneric(spr_mach3cloud_part);
l_part_type = PartTypeCreateGeneric(spr_mach3cloud_part);

part_type_scale(l_part_type, -1, 1);
PartTypeRegisterDirX(PART_TYPES.MACH3CLOUD, l_part_type, r_part_type);

r_part_type = PartTypeCreateGeneric(spr_mach4clouds_part);
l_part_type = PartTypeCreateGeneric(spr_mach4clouds_part);

part_type_scale(l_part_type, -1, 1);
PartTypeRegisterDirX(PART_TYPES.MACH4CLOUDS, l_part_type, r_part_type);

// Note Particle

part_type = part_type_create();
part_type_sprite(part_type, spr_notes_part, false, false, true);
part_type_life(part_type, 90, 100);
part_type_speed(part_type, 0.8, 1.2, 0, 0);
part_type_direction(part_type, 90, 90, 0, 0);
part_type_alpha2(part_type, 1, 0);
PartTypeRegister(PART_TYPES.NOTES, part_type);

// More Generic Particles

PartTypeRegister(PART_TYPES.PUFF, PartTypeCreateGeneric(spr_puff_part), PRIORITY.MAX);

// Ring Particle

r_part_type = PartTypeCreateGeneric(spr_ring_part_back);
l_part_type = PartTypeCreateGeneric(spr_ring_part_back);

var u_part_type = PartTypeCreateGeneric(spr_ring_part_back);
var d_part_type = PartTypeCreateGeneric(spr_ring_part_back);

part_type_scale(l_part_type, -1, 1);
part_type_scale(u_part_type, 1, -1);
part_type_orientation(u_part_type, 90, 90, 0, 0, false);
part_type_orientation(d_part_type, 90, 90, 0, 0, false);

PartTypeRegisterDirX(PART_TYPES.RING, l_part_type, r_part_type);
PartTypeRegisterDirY(PART_TYPES.RING, d_part_type, u_part_type);

r_part_type = PartTypeCreateGeneric(spr_ring_part_front);
l_part_type = PartTypeCreateGeneric(spr_ring_part_front);

u_part_type = PartTypeCreateGeneric(spr_ring_part_front);
d_part_type = PartTypeCreateGeneric(spr_ring_part_front);

part_type_scale(l_part_type, -1, 1);
part_type_scale(u_part_type, 1, -1);
part_type_orientation(u_part_type, 90, 90, 0, 0, false);
part_type_orientation(d_part_type, 90, 90, 0, 0, false);

PartTypeRegister(PART_TYPES.RING, r_part_type, PRIORITY.MAX);
PartTypeRegisterDirX(PART_TYPES.RING, l_part_type, r_part_type);
PartTypeRegisterDirY(PART_TYPES.RING, d_part_type, u_part_type);

// More Generic Particles

PartTypeRegister(PART_TYPES.SIDE_PUFF, PartTypeCreateGeneric(spr_sidepuff_part));
PartTypeRegister(PART_TYPES.SPARK, PartTypeCreateGeneric(spr_spark_part));

// Start Cloud Particle

l_part_type = PartTypeCreateGeneric(spr_startcloud_part);
r_part_type = PartTypeCreateGeneric(spr_startcloud_part);
part_type_scale(l_part_type, -1, 1);

PartTypeRegisterDirX(PART_TYPES.STARTCLOUD, l_part_type, r_part_type);

// More Generic Particles

PartTypeRegister(PART_TYPES.STOMPSTARS, PartTypeCreateGeneric(spr_stompstars_part));
PartTypeRegister(PART_TYPES.WATERSPLASH, PartTypeCreateGeneric(spr_watersplash_part));

// Block Debris

part_type = PartTypeCreateDebris(spr_block_debris, true);
part_type_speed(part_type, 6, 8, 0, 0);
part_type_direction(part_type, 0, 360, 0, 0);
PartTypeRegister(PART_TYPES.BLOCK_DEBRIS, part_type, PRIORITY.MAX);

// Generic Debris

PartTypeRegister(PartTypeCreateDebris(spr_debris, false), PRIORITY.MAX);

// Enemy Debris

part_type = PartTypeCreateDebris(spr_enemy_debris);
part_type_speed(part_type, 6, 8, 0, 0);
part_type_direction(part_type, 0, 360, 0, 0);
PartTypeRegister(PART_TYPES.ENEMY_DEBRIS, part_type);

// Level Debris

part_type = PartTypeCreateDebris(spr_hallway_debris);
part_type_speed(part_type, 6, 8, 0, 0);
part_type_direction(part_type, 0, 360, 0, 0);
PartTypeRegister(PART_TYPES.LEVEL_DEBRIS, part_type, PRIORITY.MAX);

// Metal Block Debris

part_type = PartTypeCreateDebris(spr_metalblock_debris);
part_type_speed(part_type, 6, 8, 0, 0);
part_type_direction(part_type, 0, 360, 0, 0);
PartTypeRegister(PART_TYPES.METALBLOCK_DEBRIS, part_type, PRIORITY.MAX);

// Slap Stars Debris

part_type = PartTypeCreateDebris(spr_slapstars_debris);

part_type_speed(part_type, 4, 7, 0, 0);
part_type_direction(part_type, 26, 153, 0, 0);
part_type_gravity(part_type, 0.5, 270);
part_type_orientation(part_type, 0, 360, 0, 0, false);
PartTypeRegister(PART_TYPES.SLAPSTARS_DEBRIS, part_type);

// Hurt Stars Debris

part_type = PartTypeCreateDebris(spr_slapstars_debris);
part_type_life(part_type, 30, 30);
part_type_speed(part_type, 6, 8, -0.25, 1);
part_type_direction(part_type, 0, 360, 0, 1);
part_type_gravity(part_type, 0, 0);
part_type_orientation(part_type, 0, 360, 0, 0, false);
PartTypeRegister(PART_TYPES.HURTSTARS_DEBRIS, part_type);