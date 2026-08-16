//HITSTUN_STEP;
if AnimationEnd() && sprite_index == spr_intro
	lock = false

if lock
	exit;

if !instance_exists(followingobj)
	scr_recalculate_followers()


with followingobj
	var xx = x, yy =  y, msk = mask_index, ixs = image_xscale, spr = sprite_index, inx = image_index;	

//if variable_instance_exists(basefollowobj,"visualXScale") 
//	ixs = followingobj.visualXScale
var t = 0.2
space = lerp(space, 30 * -ixs, 0.2);
var thing = {
	offsetx: round(space),
	x: xx,
	y: yy,
	xscale: ixs,
}
ds_queue_enqueue(followqueue, thing);


if ds_queue_size(followqueue) <= LAG_STEPS
	exit;	

var info = ds_queue_dequeue(followqueue);
if dir != info.xscale
	dir = info.xscale;

if interp < 1 {
	x = floor(lerp(x, info.x + info.offsetx, interp));
	y = floor(lerp(y, info.y, interp));
	interp = Approach(interp, 1, 0.01);
} else {
	x = info.x + info.offsetx;
	y = info.y;
}


sprite_index = lastposx != x && abs(lastposx - x) >= 3 ? spr_run : spr_idle
//mask_index = ds_queue_dequeue(followqueue);
image_xscale = info.xscale
lastposx = x;
lastposy = y;