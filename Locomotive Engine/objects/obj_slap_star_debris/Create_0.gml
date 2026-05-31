event_inherited();

var palette_sprite = spr_slap_star_debris_palette;
palette_index = irandom(sprite_get_width(palette_sprite));

hspeed = random_range(-5, 5); 
vspeed = random_range(-2, 10);
gravity = 0.5;
image_angle = random_range(0, 360);