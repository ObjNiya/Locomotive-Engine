event_inherited();

var collider = new Collider(bbox_left, bbox_top, bbox_bottom, bbox_right);
collider.set_slope(true, sign(image_xscale) == -1, sign(image_yscale) == -1);