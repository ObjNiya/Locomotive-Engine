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

// Game start configurations

#macro STARTING_OBJECTS [obj_fmod_studio, obj_screen, obj_camera_system]
#macro STARTING_OBJECTS_COUNT 3

// Code shortcuts

#macro SINGLETON if (instance_number(object_index) > 1) { instance_destroy(); }

#endregion

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

    global.combat_objects = [];
}

/**
 * This function will initialize all important objects the game requires to operate.
 */
function initialize_objects()
{
    var objects = STARTING_OBJECTS;
    
    for (var i = 0; i < STARTING_OBJECTS_COUNT; i++)
        instance_create(0, 0, objects[i]);
    
    if (DEBUG_MODE)
        instance_create_layer(0, 0, "Instances_1", obj_shell);
}

/**
 * This function will initialize all important global variables and objects the game requires to operate.
 */
function initialize_game()
{
    pal_swap_init_system(shd_pal_swapper, shd_pal_html_sprite, shd_pal_html_surface);
    initialize_globals();
    initialize_objects();
}