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
    
    var lvl = new Lvl(LVLS.TUTORIAL, -1, infinity, infinity, false);
    lvl.SetVisuals(c_black, mu_tutorial);
    
    lvl = new Lvl(LVLS.HALLWAY_LONGWAY, Nhall_1, 240, 30000);
    lvl.SetTitlecard(0, mu_hallway_title);
    lvl.SetVisuals(#401940, mu_hallway);
    
    lvl = new Lvl(LVLS.BLOOM_AND_DOOM, -1, 240, 0);
    lvl = new Lvl(LVLS.FOREST_MAZE, -1, 240, 0);
    lvl = new Lvl(LVLS.WIGGLERS_GARDEN, -1, 240, 0);
}