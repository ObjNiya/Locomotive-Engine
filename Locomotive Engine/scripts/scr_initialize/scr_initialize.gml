#macro DEVELOPER_MODE (os_get_config() == "Developer")
#macro DEBUG_MODE (os_get_config() == "Debug")
#macro PLAYTESTER_MODE (os_get_config() == "Playtester")

enum EFFECT_TYPES 
{
    // Particles
        
    CLOUD_PARTICLE = 0,
    RISING_PUFF_PARTICLE = 1,
    GENERIC_PUFF_PARTICLE = 2,
    GENERIC_PUFF_PARTICLE_BIG = 3,
    STOMP_PARTICLE = 4,
    EXPLOSION_PARTICLE = 5,
    EXPLOSION_PARTICLE_ALT = 6,
    
    JUMP_PARTICLE = 7,
    JUMP_PARTICLE_ALT = 8,
    LAND_PARTICLE = 9,
    
    GROUNDPOUND_PARTICLE = 10,
    TAUNT_PARTICLE = 11,
    TAUNT_PARTICLE_SMALL = 12,
    PARRY_PARTICLE = 13,
    KUNGFU_PARTICLE = 14,
    
    
    MACH2_PARTICLE = 15,
    MACH2_PARTICLE_ALT = 16,
    MACH3_CLOUD_PARTICLE = 17,
    
    MACH4_FLAME_PARTICLE = 18,
    MACH4_PUFF_PARTICLE = 19,
    MACH4_WOOSH_PARTICLE = 20,
    
    MACHROLL_START_PARTICLE = 21,
    
    END
}

enum PLAYER_CHARACTERS
{
    DAMIAN = 1,
    TV_NAUTA = 2, // Unused
    JOSE = 3 // Unused
}

/// @description This function initializes the global scope variables for the game.
function initialize_globals()
{
    // Player Characters
    
    global.char_damian = define_character(PLAYER_CHARACTERS.DAMIAN, "_damian", "Damian");
    global.char_tv_nauta = define_character(PLAYER_CHARACTERS.TV_NAUTA, "_nauta", "TV Nauta");
    global.char_jose = define_character(PLAYER_CHARACTERS.JOSE, "_jose", "Jose");
}

/// @description This function initializes important objects for the game.
function initialize_objects()
{
    instance_create_layer(0, 0, "Instances_1", obj_effect_manager);
    
    if (DEBUG_MODE)
        instance_create_layer(0, 0, "Instances_1", obj_shell);
}

/// @description This function initializes everything for the game.
function initialize_game()
{
    initialize_globals();
    initialize_objects();
}