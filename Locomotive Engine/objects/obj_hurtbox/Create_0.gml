active = true;
owner = noone;
xOffset = 0;
yOffset = 0;

targetObjs = [];
targetFuncs = [];

function addTarget(object, hurt_function)
{
    array_push(targetObjs, object);
    array_push(targetFuncs, hurt_function);
}