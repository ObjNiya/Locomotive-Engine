/// @ignore
function __PrlxDefinitions__()
{

}


function PrlxInitHub()
{
    PrlxCfgClear();
    var prlx = new PrlxLayer(0.5, 0.65);
    PrlxCfgCommit("Backgrounds_1", prlx);
    
    prlx = new PrlxLayer(0.95, 1);
    prlx.SetStill(false, true);
    prlx.AddValueModifier(0.001, "x", 0, "g_DistortOffset", 1, true);
    PrlxCfgCommit("Backgrounds_2", prlx);
}

/**
 * Configures Parallax for Secrets
 */
function PrlxInitSecret()
{
    PrlxCfgClear();
    
    var prlx = new PrlxLayer(0.4, 0.4);
    PrlxCfgCommit("Backgrounds_1", prlx);
}


/**
 * Configures Parallax for Longway Hallway
 */
function PrlxInitHallway()
{
    PrlxCfgClear();
    
    var prlx = new PrlxLayer(0.6, 0.6);
    PrlxCfgCommit("Backgrounds_1", prlx);
    
    prlx = new PrlxLayer(0.002, 0.05);
    PrlxCfgCommit("Tiles_BG1", prlx);
}


