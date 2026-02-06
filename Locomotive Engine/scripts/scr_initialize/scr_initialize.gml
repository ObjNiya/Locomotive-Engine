#region Macros

// Screen configurations
#macro GAME_WIDTH 960
#macro GAME_HEIGHT 540

// Compile configurations

#macro DEVELOPER_MODE (os_get_config() == "Developer")
#macro DEBUG_MODE (os_get_config() == "Debug")
#macro PLAYTESTER_MODE (os_get_config() == "Playtester")

// Performance configurations

#macro MAX_EFFECTS 255

// Bugfix configurations

#macro FIX_INSTATURN false

#endregion

enum PLAYER_CHARACTERS
{
    DAMIAN = 1,
    TV_NAUTA = 2, // Unused
    JOSE = 3, // Unused
}

/**
 * This function will initialize all important global variables the game requires to operate.
 */
function initialize_globals()
{
    // Font defintions
    
    global.bigfont = font_add_sprite_ext(spr_bigfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¿?.:1234567890ÁÉÍÓÚ", 1, 0);
    global.mediumfont = font_add_sprite_ext(spr_mediumfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", 1, 2);
    global.smallfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!.,_1234567890:?", 1, 0);    
    global.minifont = font_add_sprite_ext(spr_minifont, "0123456789:.", 1, 0);

    global.pointsbookfont = font_add_sprite_ext(spr_pointsbook_font, "1234567890", 1, -16);
    global.pointsnumberfont = font_add_sprite_ext(spr_pointsnumberfont, "1234567890", 1, 0);
    global.combofont = font_add_sprite_ext(spr_combo_bar_font, "0123456789", 1, 0);

    // Player Character definitions
    
    global.char_damian = define_character(PLAYER_CHARACTERS.DAMIAN, "_damian", "Loco Damian");
    char_define_event_paths(global.char_damian, [
        ["sfx_step", sfx_damian_step],
        ["sfx_jump", sfx_damian_jump],
        ["sfx_hair_scratch", sfx_damian_hair_scratch],
        ["sfx_voice_idle", sfx_damian_voice_idle],
        ["sfx_voice_happy", sfx_damian_voice_happy],
        ["sfx_voice_hurt", sfx_damian_voice_hurt],
        ["sfx_voice_plushie", sfx_damian_voice_plushie],
        ["sfx_voice_catripi", sfx_damian_voice_catripi],
        ["sfx_mach", sfx_damian_mach],
        ["sfx_mach_turn", sfx_damian_mach_turn],
        ["sfx_mach_brake", sfx_damian_mach_brake]
    ]);

    global.char_tv_nauta = define_character(PLAYER_CHARACTERS.TV_NAUTA, "_nauta", "TV Nauta");
    global.char_jose = define_character(PLAYER_CHARACTERS.JOSE, "_jose", "Jose");
    
    // Level definitions
    
    global.lvl_hallway = define_level("Hallway Longway", rm_hallway_1, 50, true, 6000);
    global.lvl_bloom_and_doom = define_level("Bloom And Doom", rm_initialize, 50, true, 3000);
    
    // Room transition
    
    global.target_room = noone;
    global.target_spawnpoint = "A";
    
    global.spawnpoints = {
        A: obj_spawnpoint_a,
        B: obj_spawnpoint_b,
        C: obj_spawnpoint_c,
        D: obj_spawnpoint_d,
        E: obj_spawnpoint_e,
        F: obj_spawnpoint_f
    }
    
    // Level system
    
    global.level = pointer_null;

    // Other definitions

    global.saveroom = ds_map_create();
    global.essential_objects = [obj_screen, obj_fmod_studio_manager];
}

/**
 * This function will initialize all important objects the game requires to operate.
 */
function initialize_objects()
{
    instance_create(0, 0, obj_screen);
    instance_create(0, 0, obj_parallax);
    instance_create(0, 0, obj_fmod_studio_manager);
    instance_create(0, 0, obj_camera_manager);
    
    if (DEBUG_MODE)
        instance_create_layer(0, 0, "Instances_1", obj_shell);
}

/**
 * This function will initialize all important global variables and objects the game requires to operate.
 */
function initialize_game()
{
    initialize_globals();
    initialize_objects();
}