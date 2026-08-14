/// @ignore
function ___LvlsDefine__()
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
    
    new Lvl(LVLS.TUTORIAL, -1, infinity, infinity, mu_tutorial, -1, mu_hallway_title, #000000, false);
    new Lvl(LVLS.HALLWAY_LONGWAY, Nhall_1, 240, 30000, mu_hallway, 0, mu_hallway_title, #401940);
    new Lvl(LVLS.BLOOM_AND_DOOM, -1, 240, 0, mu_doom, -1, mu_hallway_title, #000000);
    new Lvl(LVLS.FOREST_MAZE, -1, 240, 0, mu_maze, -1, mu_hallway_title, #000000);
    new Lvl(LVLS.WIGGLERS_GARDEN, -1, 240, 0, mu_hallway, -1, mu_hallway_title, #000000);
}