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

#macro STARTING_OBJECTS [obj_fmod_studio, obj_screen, obj_camera_system, obj_room_goto, obj_struct_updater, obj_layer_manager]
#macro STARTING_OBJECTS_COUNT 6

// Code shortcuts

#macro SINGLETON if (instance_number(object_index) > 1) { instance_destroy(); }

#endregion

enum DEPTHS
{
    FRONT = -50,
    
    CLOSEST = -30,
    CLOSER = -20,
    CLOSE = -10,
    
    MIDDLE = 0,
    
    FAR = 10,
    FARTHER = 20,
    FARTHEST = 30,
    
    BACK = 50,
}

/**
 * This function will initialize all important global variables the game requires to operate.
 */
function initialize_globals()
{
    enum RANKS 
    {
        L = 0,
        S = 1,
        A = 2,
        B = 3,
        C = 4,
        D = 5, 
    }
    
    with (global)
    {
        // Secret Tiles
        
        scrt_ts_circle_x = 0;
        scrt_ts_circle_y = 0;
        scrt_ts_circle_radius = 0;
        
        // Button Prompt image index map
        
        keybrd_sp_prompts_map = ds_map_create();
        keybrd_sp_prompts_map[? "shift"] = 0;
        keybrd_sp_prompts_map[? "ctrl"] = 1;
        keybrd_sp_prompts_map[? "_"] = 2;
        keybrd_sp_prompts_map[? "arrow up"] = 3;
        keybrd_sp_prompts_map[? "arrow down"] = 4;
        keybrd_sp_prompts_map[? "arrow left"] = 5;
        keybrd_sp_prompts_map[? "arrow right"] = 6;
        
        // Font defintions
        
        signfont = font_add_sprite_ext(spr_signfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!,.:0123456789'?-", true, 2);
        bigfont = font_add_sprite_ext(spr_bigfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¿?.:1234567890ÁÉÍÓÚ", 1, 0);
        mediumfont = font_add_sprite_ext(spr_mediumfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", 1, 2);
        smallfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!.,_1234567890:?", 1, 0);    
        minifont = font_add_sprite_ext(spr_minifont, "0123456789:.", 1, 0);
    
        pointsbookfont = font_add_sprite_ext(spr_pointsbook_font, "1234567890", 1, -16);
        pointsnumberfont = font_add_sprite_ext(spr_pointsnumberfont, "1234567890", 1, 0);
        combofont = font_add_sprite_ext(spr_combobar_font, "0123456789", 1, 0);
    
        // Room goto
    
        target_room = -1;
        target_spawn = -1;
    
        // Level data
    
        level = -1;
    
        showtime_timer = new Timer(60, time_source_units_seconds, function() {
            trace("Out of time!"); // TODO: Spawn Marx and code him
        });
        combo_timer = new Timer(6.75, time_source_units_seconds, function() {
            trace("Combo lost!");
            global.combo = 0;
        })
            
        plushies = {
            waddledoo: false,
            koopa: false,
            squash: false,
            cappy: false,
            wario: false
        }
     
        rank = RANKS.D;
        points = 0;
        combo = 0;
        secrets_found = 0;
        laps = 0;
        treasure_found = false;
        full_combo = false;
    
    
        // Other definitions
    
        saveroom = ds_map_create();
    
        combat_objects = [];
    }   
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
    initialize_objects();
    initialize_globals();
}