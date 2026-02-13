/// @ignore
function INIT__define_levels__()
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
    
    lvl_define(LVLS.TUTORIAL,        -1,           infinity, infinity, -1, false);
    lvl_define(LVLS.HALLWAY_LONGWAY, rm_hallway_1, 240,      30000,    0);
    lvl_define(LVLS.BLOOM_AND_DOOM,  -1,           240,      0,        -1);
    lvl_define(LVLS.FOREST_MAZE,     -1,           240,      0,        -1);
    lvl_define(LVLS.WIGGLERS_GARDEN, -1,           240,      0,        -1);
}