if (!global.__showHitboxes__)
    exit;

var color = c_white;

if (canAttack && canHurt)
    color = c_orange;
else if (canAttack)
    color = c_red;
else if (canHurt)
    color = c_lime;

draw_sprite_ext(mask_index, 0, x, y, image_xscale, image_yscale, image_angle, c_grey, 0.35);
draw_sprite_ext(mask_index, 0, owner.x, owner.y, owner.image_xscale, owner.image_yscale, owner.image_angle, color, 0.7);
