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
    if (PrlxCfgNameGet() == "hallway")
        return;
    
    PrlxCfgClear();
    
    var prlx = new PrlxLayer(0.6, 0.6);
    PrlxCfgCommit("Backgrounds_2", prlx);
        
    prlx = new PrlxLayer(0.4, 0.4);
    PrlxCfgCommit("Backgrounds_1", prlx);
    
    PrlxCfgNameSet("hallway");
}


