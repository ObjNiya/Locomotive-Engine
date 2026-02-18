if swapfollow == 0
{
	with par_toppin
	{
		if spr_idle == spr_patripi_idle
		{
			scr_move_follower_to_front(basefollowobj.id)
		}
	}
}
if swapfollow == 1
{
	with par_toppin
	{
		if spr_idle == spr_shyguy_stun
		{
			scr_move_follower_to_front(basefollowobj.id)
		}
	}
}
if swapfollow == 2
{
	with par_toppin
	{
		if spr_idle == spr_waddledee_stun
		{
			scr_move_follower_to_front(basefollowobj.id)
		}
	}
}
swapfollow++
alarm[2] = 120