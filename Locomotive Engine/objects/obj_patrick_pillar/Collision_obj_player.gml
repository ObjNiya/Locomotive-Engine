if (cutsceneStarted)
    exit;

if (other.instakillmove || other.stateName == "Grabdash")
{
    cutsceneStarted = true;
    StartPillarCutscene(other, id);
}