if (is_callable(stepEvent))
    stepEvent();

skipBindPressed = InputPressed(skipBind);

array_foreach(skips, function(seg_skip, index) {
    var cutscene_pos = getCutscenePos();

    if (cutscene_pos < seg_skip.skipFrom || cutscene_pos >= seg_skip.skipTo)
        return;
    
    if (skipBindPressed && alarm[1] <= 0 && !seg_skip.instaSkip) 
    {
        alarm[1] = CUTSCENE_SKIP_PROMPT_DURATION;
        skipBindPressed = false;
    }
    else if (skipBindPressed)
    {
        if (is_callable(seg_skip.skipFunc))
            seg_skip.skipFunc();
        performSkip(seg_skip.skipTo);
        
        alarm[1] = -1;
        skipBindPressed = false;
    }
});

if (getCutscenePos() >= loopFrom && loop)
    setCutscenePos(loopTo);

if (getCutscenePos() >= getCutsceneLen())
    instance_destroy();