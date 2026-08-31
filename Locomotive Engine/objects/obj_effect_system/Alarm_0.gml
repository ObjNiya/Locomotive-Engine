// I have to do this oh my god fuck it hurts so much FUCKKKK

array_foreach(effects, function(effect, index) {
    if (is_struct(effect) && !effect.exists)
        effect.Destroy();
});

alarm[0] = cleanUpInterval;
QuickLog("CLEAN UP")