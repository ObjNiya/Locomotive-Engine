global.trailfollowers_map = ds_map_create()

//create EVERY follower objects with this function, do NOT use instance create
function create_follower(_x = x,_y =  y,objecttospawn,followingbase = id)
{
	var thing = instance_create(_x,_y,objecttospawn)
	with thing
	{
		scr_setupfollowingbase(followingbase)
	}
	return thing
}


//initializes in every follower object
function following_obj_init()
{
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
	depth = -6;
}

//use this to set a followers base follow object, can be used at the start of creation or in the middle of it following another object and it will work automatically
function scr_setupfollowingbase(_basefollowobj = obj_player.id, _id = id)
{
	//sets up the base of a follower
	if basefollowobj != -4
	{
		if basefollowobj != noone
		{
			if basefollowobj != _basefollowobj
			{
				scr_delete_follower(basefollowobj)
			}
		}
	}
	basefollowobj = _basefollowobj
	//trailnum is the closest to the base following object, essentially the first object
	//will try to make it clamp to however many followers there are
	
	//if the list doesnt exist yet, create a list
	if !ds_map_exists(global.trailfollowers_map,_basefollowobj)
	{
		var followlist = ds_list_create()
		//create a list, add the list to the proper base follow id
		ds_map_add_list(global.trailfollowers_map, _basefollowobj, followlist);
	}
	
	
	//add to base follow object list
	ds_list_add(
	ds_map_find_value(global.trailfollowers_map, _basefollowobj),
	_id
	)
	
	//get proper follow number
	pos = ds_list_find_index(
	ds_map_find_value(global.trailfollowers_map, _basefollowobj),
	_id
	)
	
	followingobj = (pos > 0) ? ds_list_find_value(ds_map_find_value(global.trailfollowers_map, _basefollowobj), pos - 1) : _basefollowobj;
	
}

function scr_recalculate_followers(baseobj = obj_player.id)
{
	var listsize = ds_list_size(ds_map_find_value(global.trailfollowers_map, baseobj))
	
	for (var i = listsize; i >= 0; i--)
	{
		with ds_list_find_value(ds_map_find_value(global.trailfollowers_map, baseobj),i)
		{
			pos = ds_list_find_index(ds_map_find_value(global.trailfollowers_map, baseobj), id);
			
			var prevfollowingobj = followingobj
			followingobj = (pos > 0) ? ds_list_find_value(ds_map_find_value(global.trailfollowers_map, baseobj), pos - 1) : baseobj;
			
			if prevfollowingobj != followingobj
				setlaglerp = 0.1
			//if changed what objects is being followed, 
			
			trace(ds_list_find_value(ds_map_find_value(global.trailfollowers_map, baseobj),i))
		}
	}
}

function scr_delete_follower(baseobj = obj_player.id, _id = id)
{
	if !ds_map_exists(global.trailfollowers_map,baseobj)
		return noone
	
	var p = ds_list_find_index(ds_map_find_value(global.trailfollowers_map, baseobj), id);
	
	ds_list_delete(ds_map_find_value(global.trailfollowers_map, baseobj), p);
	
	scr_recalculate_followers(baseobj)
}

function scr_move_follower_to_front(baseobj,_id = id)
{
	if !ds_map_exists(global.trailfollowers_map,baseobj)
		return noone
	
	var p = ds_list_find_index(ds_map_find_value(global.trailfollowers_map, baseobj), _id);
	
	ds_list_delete(ds_map_find_value(global.trailfollowers_map, baseobj), p);
	
	ds_list_insert(ds_map_find_value(global.trailfollowers_map, baseobj),0, _id);
	
	scr_recalculate_followers(baseobj)
}