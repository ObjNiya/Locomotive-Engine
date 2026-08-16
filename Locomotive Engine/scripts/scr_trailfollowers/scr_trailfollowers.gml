global.trailfollowers_map = ds_map_create()

//create EVERY follower objects with this function, do NOT use instance create
function create_follower(_tag, _x = x,_y =  y,followingbase = id) {
	static getSprite = function(_tag, _subtag) { return asset_get_index("spr_" + _tag + "_" + _subtag) }
	with InstanceCreate(_x,_y, par_follower) {
		spr_intro = asset_get_index("spr_" + _tag + "_intro")
		spr_panic = asset_get_index("spr_" + _tag + "panic")
		spr_run = getSprite(_tag, "run")
		spr_runpanic = getSprite(_tag, "runpanic")
		spr_taunt = getSprite(_tag, "taunt")
		spr_idle = asset_get_index("spr_" + _tag)
		sprite_index = spr_intro
		image_index = 0
		lock = true
		scr_setupfollowingbase(followingbase)
		return id;
	}
}


//initializes in every follower object
function following_obj_init() {
	yoffset = 2;
	
	LAG_STEPS = 6; //six frames behind the player baisically
	
	xoffset = 8 * LAG_STEPS; //about walking speed times lag steps
	//means that they should be following at the exact same length when walking as they are when standing still
	
	followqueue = ds_queue_create();
	
	baseobjfollowqueue = -4 //to implement later
	
	dir = image_xscale;
	space = 0;
	maxspace = 1;
	spaceaccel = 0.2;
	prevx = x
	prevy = y
	setlaglerp = 1
	lastposx = x;
	lastposy = y;
	interp = 0.05;
	basefollowobj = noone
	followingobj = noone
	lock = false;
	depth = DEPTHS.FAR

	image_speed = 0.35
}

//use this to set a followers base follow object, can be used at the start of creation or in the middle of it following another object and it will work automatically
function scr_setupfollowingbase(_basefollowobj = obj_player.id, _id = id) {
	//sets up the base of a follower
	if basefollowobj != -4 && basefollowobj != noone && basefollowobj != _basefollowobj
		scr_delete_follower(basefollowobj)
	basefollowobj = _basefollowobj
	//trailnum is the closest to the base following object, essentially the first object
	//will try to make it clamp to however many followers there are
	
	//if the list doesnt exist yet, create a list
	if !ds_map_exists(global.trailfollowers_map,_basefollowobj) //create a list, add the list to the proper base follow id
		ds_map_add_list(global.trailfollowers_map, _basefollowobj, ds_list_create());

	var _list = global.trailfollowers_map[?_basefollowobj]
	//add to base follow object list
	ds_list_add(_list, _id)
	
	//get proper follow number
	pos = ds_list_find_index(_list, _id)
	followingobj = (pos > 0) ? ds_list_find_value(_list, pos - 1) : _basefollowobj;
	
}

function scr_recalculate_followers(baseobj = obj_player.id) {
	var _list = global.trailfollowers_map[? baseobj]
	
	if ds_list_empty(_list)
		exit;
		
	for (var i = ds_list_size(_list); i >= 0; i--) {
		with _list[| i] {
			var prevfollowingobj = followingobj
			
			pos = ds_list_find_index(_list, id);
			followingobj = (pos > 0) ? _list[| pos - 1] : baseobj;
			
			if prevfollowingobj != followingobj
				setlaglerp = 0.1
			//if changed what objects is being followed, 
		}
	}
}

function scr_delete_follower(baseobj = obj_player.id, _id = id) {
	
	if !ds_map_exists(global.trailfollowers_map, baseobj)
		exit;
		
	var _list = global.trailfollowers_map[? baseobj]

	ds_list_delete(_list, ds_list_find_index(_list, id));
	scr_recalculate_followers(baseobj)
}

function scr_move_follower_to_front(baseobj,_id = id) {
	if !ds_map_exists(global.trailfollowers_map,baseobj)
		exit;
	
	var _list = global.trailfollowers_map[? baseobj]

	ds_list_delete(_list, ds_list_find_index(_list, _id));
	ds_list_insert(_list, 0, _id);
	
	scr_recalculate_followers(baseobj)
}