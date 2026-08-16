if (cutsceneStarted)
    exit;

if (other.instakillHitbox.canAttack || other.stateName == "Grabdash")
{
    cutsceneStarted = true;
    instance_destroy();
    //StartPillarCutscene(other, id);
}