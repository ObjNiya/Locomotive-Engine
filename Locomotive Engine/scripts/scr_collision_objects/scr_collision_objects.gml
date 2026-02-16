/*global.rm_colliders = [];

function Collider(x, y) constructor
{
    self.x = x;
    self.y = y;
    
    solid = true;
    
    conveyor_spd = 0;
    
    array_push(global.rm_colliders, self);
}

function Wall(left_corner, top_corner, right_corner, bottom_corner) : Collider(x, y) constructor
{
    left = left_corner;
    top = top_corner;
    right = right_corner;
    bottom = bottom_corner;
}

function Slope(slope_curve) : Wall(left_corner, top_corner, right_corner, bottom_corner) constructor
{
    curve = slope_curve;
}