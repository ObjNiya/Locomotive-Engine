timescale = 1;
imageSpeed = 1;

TimescaleStep = function()
{
    timescale = abs(timescale);
    image_speed = imageSpeed * timescale;
}

ManageAlarms = function()
{
    array_foreach(alarm, function(time, index) {
        if (time > -1)
            time -= (timescale - 1) + (global.deltaTime - 1);
    });
}