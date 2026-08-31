if (!IsSecret())
    exit;

var ghost_points = layer_sprite_create(layer, xstart, ystart, sprite_index);
layer_sprite_alpha(ghost_points, 0.5);