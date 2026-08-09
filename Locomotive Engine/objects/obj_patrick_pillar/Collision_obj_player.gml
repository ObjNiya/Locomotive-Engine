if (cutsceneStarted)
    exit;

if (other.instakillmove || other.stateName == "Grabdash")
{
    cutsceneStarted = true;
    instance_destroy();
    //StartPillarCutscene(other, id);
}