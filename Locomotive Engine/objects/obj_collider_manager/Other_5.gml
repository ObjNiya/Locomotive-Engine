var i = 0;
var collider_count = array_length(global.colliders);

repeat (collider_count)
{
    if (!global.colliders[i].persists)
        array_delete(global.colliders, i, 1);
    else
        i++;
}