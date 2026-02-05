var timer_count = array_length(timers);

for (var i = 0; i < timer_count; i++)
{
    var timer = timers[i];
    
    timer.step();
}