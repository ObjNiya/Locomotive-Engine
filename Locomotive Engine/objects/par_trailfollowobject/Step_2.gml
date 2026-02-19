
if lock
	exit;

if (followingobj != -4 && !instance_exists(followingobj))
	followingobj = -4;

var tx = round(xoffset * space);
var xx =  followingobj.x;
var yy =  followingobj.y;
var msk = followingobj.mask_index;
var ixs = followingobj.image_xscale;
var spr = followingobj.sprite_index;
var inx = followingobj.image_index;

var st = noone
var _hsp = 0


if variable_instance_exists(followingobj,"state")
{
	st = followingobj.state
}

if variable_instance_exists(basefollowobj,"hsp")
{
	_hsp = followingobj.hsp
}


var thing = {
offsetx: tx,
x: xx,
y: yy,
xscale: ixs,
state: st,
hsp: _hsp,
sprite_index: spr,
image_index: inx
}


ds_queue_enqueue(followqueue, thing); //de-queue the end of the queue to a variable



if (ds_queue_size(followqueue) > (LAG_STEPS)) // if behind the correct ammount of frames
{
	
	var thingie = ds_queue_dequeue(followqueue);
	
	
	
	if dir != thing.xscale
		dir = thing.xscale;
		
	if interp < 1
	{
		x = lerp(x, thingie.x + space, interp);
		y = lerp(y, thingie.y, interp);
		interp = approach(interp, 1, 0.01);
	}
	else
	{
		x = thingie.x + space;
		y = thingie.y;
	}
	
	image_xscale = thingie.xscale
	lastplayerposx = thingie.x;
	lastplayerposy = thingie.y;
}
