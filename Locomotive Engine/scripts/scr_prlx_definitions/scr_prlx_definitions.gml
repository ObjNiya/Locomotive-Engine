/// @ignore
function __PrlxDefinitions__()
{

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


