var timer_count = array_length(timers);

for (var i = 0; i < timer_count; i++)
{
    var timer = timers[i];
    
    /*if (!instance_exists(timer.parent))
    {
        array_delete(timers, i, 1);
        i = 0;
        continue;
    }*/

    timer.step();
}