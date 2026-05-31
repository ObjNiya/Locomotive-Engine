if (!active)
    exit;

var target_count = min(array_length(targetObjs), array_length(targetFuncs));
var i = 0;

repeat (target_count)
{
    var target = instance_place(x, y, targetObjs[i]);
    with (target)
    {
        if (invincibleBuffer <= 0)
            targetFuncs[i]();
    }
    
    i++;
}