#macro HITSTUN_STEP if (hitstunStep()) exit

function hitstunInit()
{
    hitstunShakeMag = 4;
    hitstunX = 0;
    hitstunY = 0;
    
    hitstunTimer = new Timer(5, time_source_units_frames, function() {
        x = hitstunX;
        y = hitstunY;
        
        hitstunTimer.Stop();
    })
}

function hitstunApply(duration, shake_magnitude = 4)
{
    hitstunTimer.maxTime = duration;
    hitstunShakeMag = shake_magnitude
    
    hitstunX = x;
    hitstunY = y;
    
    hitstunTimer.Start();
}

function hitstunStep()
{
    hitstunTimer.Step();
    
    if (hitstunTimer.state != TIMER_STATES.STARTED)
        return false;
    
    x = hitstunX + irandom_range(-hitstunShakeMag, hitstunShakeMag);
    y = hitstunY + irandom_range(-hitstunShakeMag, hitstunShakeMag);
    
    return true;
}