#macro SECRET_COUNT 3

/// @ignore
function __define_levels__()
{
    enum LVLS
    {
        // Floor 1
        
        TUTORIAL = 0,
        HALLWAY_LONGWAY = 1,
        BLOOM_AND_DOOM = 2,
        FOREST_MAZE = 3,
        WIGGLERS_GARDEN = 4,
    }
    
    lvl_define(LVLS.TUTORIAL,        -1,           infinity, infinity, -1, mu_hallway_title, #000000, false);
    lvl_define(LVLS.HALLWAY_LONGWAY, Nhall_1, 240,       30000,         0, mu_hallway_title, #401940);
    lvl_define(LVLS.BLOOM_AND_DOOM,  -1,           240,      0,        -1, mu_hallway_title, #000000);
    lvl_define(LVLS.FOREST_MAZE,     -1,           240,      0,        -1, mu_hallway_title, #000000);
    lvl_define(LVLS.WIGGLERS_GARDEN, -1,           240,      0,        -1, mu_hallway_title, #000000);
}