function initialize_collider(triangle)
{
    self.triangle = triangle;
    can_collide = true;
    
    conveyor_spd = 0;
    
    initialize_physics();
    grav = 0;
}