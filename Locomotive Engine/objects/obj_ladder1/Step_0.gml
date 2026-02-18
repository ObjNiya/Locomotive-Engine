var list = ds_list_create()
var listsize = instance_place_list(x,y - 1,[obj_player],list,false)
for(var i = 0; i < listsize; i++)
{
	var listinst = list[|i]
	


    with (listinst)
    {
    	var inviablestate = /* is_check(state,
    	[
    	states.normal,states.jump,states.mach2,states.mach3,states.handstandjump,states.punch,states.crouch,states.ratmountcrouch,states.ratmount,states.ratmountjump//how the fuck did i forget the crouch state
    	])
         */
        array_contains([playerState.normal, playerState.mach2, playerState.mach3], state)
    	
    	var check_up = (up_held && place_meeting(x, y, obj_ladder))
    	var check_down = (down_held && place_meeting(x, y + 1, obj_ladder) && !place_meeting(x, y + 1, obj_solid))
    	if ((check_up || check_down) && inviablestate)
    	{
    		if check_down
    			y += 5
    		state = playerState.ladder
    		hsp = 0
    		movespeed = 0
    		x = other.x + 16
            ladderx = other.x + 16
    	}
    }
	
}
ds_list_destroy(list)