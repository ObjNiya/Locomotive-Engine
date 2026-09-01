/// @ignore
function __AABB__(sx1, sy1, sx2, sy2, dx1, dy1, dx2, dy2)
{
    return (sx1 < dx2 && sx2 > dx1 && sy1 < dy2 && sy2 > dy1);
}