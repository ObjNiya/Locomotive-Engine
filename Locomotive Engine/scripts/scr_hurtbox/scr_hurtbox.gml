function hurtSysInit()
{
    invincibleBuffer = 0;
}

function hurtSysStep()
{
    if (invincibleBuffer > 0)
        invincibleBuffer--;
}