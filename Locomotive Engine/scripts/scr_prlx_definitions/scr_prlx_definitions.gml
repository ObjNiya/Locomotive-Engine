/// @ignore
function __PrlxDefinitions__()
{

}


/**
 * Configures Parallax for Hubs.
 */
function PrlxInitHub()
{
    if (PrlxCfgNameGet() == "hub")
        return;
    
    PrlxCfgClear();
    var prlx = new PrlxLayer(0.5, 0.65);
    PrlxCfgCommit("Backgrounds_1", prlx);
    
    prlx = new PrlxLayer(0.9, 1);
    prlx.SetStill(false, true);
    prlx.AddValueModifier(0.001, "x", 0, "g_DistortOffset", 1, true);
    PrlxCfgCommit("Backgrounds_2", prlx);
    
    PrlxCfgNameSet("hub");
}


/**
 * Configures Parallax for Secrets.
 */
function PrlxInitSecret()
{
    if (PrlxCfgNameGet() == "secret")
        return;
    
    PrlxCfgClear();
    
    var prlx = new PrlxLayer(0.4, 0.4);
    PrlxCfgCommit("Backgrounds_1", prlx);
    
    PrlxCfgNameSet("secret");
}


/**
 * Configures Parallax for Longway Hallway.
 */
function PrlxInitHallway()
{
    var prlx_name = (global.targetRoom == Nhall_8 || global.targetRoom == Nhall_9) ? "hallway_alt" : "hallway";
    
    if (PrlxCfgNameGet() == prlx_name)
        return;
    
    PrlxCfgClear();
    
    if (prlx_name == "hallway_alt")
    {
        var prlx = new PrlxLayer(0.4, 0.4);
        PrlxCfgCommit("Backgrounds_1", prlx);
        
        prlx = new PrlxLayer(0.6, 0.6);
        PrlxCfgCommit("Backgrounds_2", prlx);
    }
    else
    {
        var prlx = new PrlxLayer(0.6, 0.6);
        PrlxCfgCommit("Backgrounds_1", prlx);
        
        prlx = new PrlxLayer(0.002, 0.05);
        PrlxCfgCommit("Tiles_BG1", prlx);
    }
    
    PrlxCfgNameSet(prlx_name);
}


