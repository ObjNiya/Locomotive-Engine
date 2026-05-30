lifespan.Step();

depth = spawner_id.depth - 1;

x = spawner_id.x;
y = spawner_id.y;

sprite_index = spawner_id.sprite_index;
image_index = spawner_id.image_index;

image_blend = spawner_id.image_blend;
image_alpha = spawner_id.image_alpha * real(spawner_id.visible);

image_xscale = spawner_id.image_xscale;
image_yscale = spawner_id.image_yscale;
image_angle = spawner_id.image_angle;

if (has_vh)
{
    x += spawner_id.visual_x;
    y += spawner_id.visual_y;
    
    image_xscale *= spawner_id.visual_xscale;
    image_yscale *= spawner_id.visual_yscale;
    
    image_angle += spawner_id.visual_angle;
}