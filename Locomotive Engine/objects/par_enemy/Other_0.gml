if (y > room_height + 100)
    instance_destroy();

var threshold = 400;
var perform_destroy = false;

if (stateName == "Thrown")
{
    threshold = 100;
    perform_destroy = true;
}

if (x > -threshold || x > room_width + threshold || y > -threshold || y > room_height + threshold)
    instance_destroy(id, perform_destroy);